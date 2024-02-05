module HydrOGEnMod_Logging

using Logging
using Printf
import Base.CoreLogging.handle_message

export @_status, @_warning, @_error, scientific, temporal

struct CustomLogLevel
    level::Int32
    name::String
    color::Symbol
end

const log_status = CustomLogLevel(1500, "Status", :light_green)
const log_warning = CustomLogLevel(1000, "Warning", :light_yellow)
const log_error = CustomLogLevel(2000, "Error", :light_red)

Base.isless(a::CustomLogLevel, b::LogLevel) = isless(a.level, b.level)
Base.isless(a::LogLevel, b::CustomLogLevel) = isless(a.level, b.level)
Base.convert(::Type{LogLevel}, level::CustomLogLevel) = LogLevel(level.level)
Base.convert(::Type{Int32}, level::CustomLogLevel) = level.level
Base.show(io::IO, level::CustomLogLevel) = print(io, level.name)

scientific(arg::Number) = Printf.@sprintf("%.5e", arg)
temporal(arg::Number) = Printf.@sprintf("%10.2fs", arg)

function handle_message(
    logger::ConsoleLogger,
    level::CustomLogLevel,
    message,
    _module,
    group,
    id,
    filepath,
    line;
    kwargs...,
)
    # @nospecialize
    maxlog = get(kwargs, :maxlog, nothing)
    offset = lpad("", get(kwargs, :offset, 0))
    logfile = get(kwargs, :logfile, "")

    if maxlog isa Core.BuiltinInts
        remaining = get!(logger.message_limits, id, Int(maxlog)::Int)
        logger.message_limits[id] = remaining - 1
        remaining > 0 || return
    end
    buf = IOBuffer()
    stream::IO = logger.stream
    if !(isopen(stream)::Bool)
        stream = stderr
    end
    iob = IOContext(buf, stream)
    if length(logfile) > 0
        file = open(logfile, "a")
    end
    levelstr = level.name
    msglines = eachsplit(chomp(convert(String, string(message))::String), '\n')
    msg1, rest = Iterators.peel(msglines)
    printstyled(
        iob,
        offset,
        "┌ ",
        levelstr,
        ": ",
        msg1,
        '\n',
        ;
        bold = true,
        color = level.color,
    )
    length(logfile) > 0 && printstyled(
        file,
        offset,
        "┌ ",
        levelstr,
        ": ",
        msg1,
        '\n',
        ;
        bold = true,
        color = level.color,
    )

    for msg in rest
        printstyled(iob, offset, "│ ", msg, '\n', ; bold = true, color = level.color)
        length(logfile) > 0 &&
            printstyled(file, offset, "│ ", msg, '\n', ; bold = true, color = level.color)
    end
    for (key, val) in kwargs
        key === :maxlog && continue
        key === :offset && continue
        key === :logfile && continue
        printstyled(iob, offset, "│   "; bold = true, color = level.color)
        println(iob, rpad(string(key, ": "), 35), lpad(val, 50))
        if length(logfile) > 0
            printstyled(file, offset, "│   "; bold = true, color = level.color)
            println(file, rpad(string(key, ": "), 35), lpad(val, 50))
        end
    end
    printstyled(
        iob,
        offset,
        "└ @ ",
        _module,
        " ",
        filepath,
        ":",
        line,
        '\n',
        ;
        bold = true,
        color = level.color,
    )
    length(logfile) > 0 && printstyled(
        file,
        offset,
        "└ @ ",
        _module,
        " ",
        filepath,
        ":",
        line,
        '\n',
        ;
        bold = true,
        color = level.color,
    )
    write(stream, take!(buf))
    length(logfile) > 0 && close(file)
    nothing
end

function maybe_make_kwargs(ex)
    if ex isa Expr && ex.head === :(=) || ex isa Expr && ex.head === :...
        # @assert length(ex.args) == 2 "Expression in maybe_make_kwargs(ex) has more than 2 arguments"
        return Expr(:(=), ex.args[1], esc(ex.args[2]))
    else
        return Expr(:(=), ex, esc(ex))
    end
end

macro _status(exs...)
    location = LineNumberNode(__source__.line, __source__.file)
    message = esc(exs[1])
    kwargs = map(maybe_make_kwargs, exs[2:end])
    Expr(
        :macrocall,
        Base.CoreLogging.var"@logmsg",
        location,
        log_status,
        message,
        kwargs...,
    )
end

macro _warning(exs...)
    location = LineNumberNode(__source__.line, __source__.file)
    message = esc(exs[1])
    kwargs = map(maybe_make_kwargs, exs[2:end])
    Expr(
        :macrocall,
        Base.CoreLogging.var"@logmsg",
        location,
        log_warning,
        message,
        kwargs...,
    )
end

macro _error(exs...)
    location = LineNumberNode(__source__.line, __source__.file)
    message = esc(exs[1])
    kwargs = map(maybe_make_kwargs, exs[2:end])
    Expr(:macrocall, Base.CoreLogging.var"@logmsg", location, log_error, message, kwargs...)
end

end

using .HydrOGEnMod_Logging
