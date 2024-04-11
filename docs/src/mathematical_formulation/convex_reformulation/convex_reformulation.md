# Convex Optimization Problem
```math
\begin{aligned}	
\max_{\substack{q^{I}_{pibmy}, \\ q^{P \rightarrow T}_{pcomy}, \\ \Delta^{I}_{piby}, \\ \Delta^{P}_{pcoy}, \\ q^{T \rightarrow D}_{tncbomy}, \\ q^{V}_{vtcdomy}, \\ \Delta^{V}_{vcc'y}, \\ \Delta^{RV}_{vrr'cc'y}, \\ q^{T}_{tacomy}, \\ \Delta^{A}_{acy}, \\ \Delta^{RA}_{arcy}, \\ q^{S}_{stcomy}, \\q^{S_{in}}_{stcomy}, \\ q^{S_{out}}_{stcomy}, \\  \Delta^{S}_{scy}, \\ \Delta^{RS}_{scry} }}  \quad & \sum_{y \in \mathcal{Y}} r_{y}  \left[ 
			\begin{aligned}
				\sum_{m \in \mathcal{M}} d_m \sum_{c \in \mathcal{C}} \sum_{n \in \mathcal{N}} \left( 
				\begin{aligned}
					\frac{1}{2} \sum_{b \in \mathcal{DSB}} \beta^{D}_{ncbmy} \left( \sum_{t \in \mathcal{T}} \sum_{o \in \mathcal{O}} q^{T \rightarrow D}_{tncbomy} \right)^2 \\
					+ \sum_{b \in \mathcal{DSB}} \alpha^{D}_{ncbmy} \left( \sum_{t \in \mathcal{T}} \sum_{o \in \mathcal{O}} q^{T \rightarrow D}_{tncbomy} \right) \\
					+ \frac{1}{2} \sum_{t \in \mathcal{T}} {1}^{NC}_{tnc} \sum_{b \in \mathcal{DSB}} \beta^{D}_{ncbmy} \left( \sum_{o \in \mathcal{O}} q^{T \rightarrow D}_{tncbomy} \right)^2 \\
				\end{aligned}
				\right) \\
				- \sum_{p \in \mathcal{P}} \sum_{i \in \mathcal{I}} \sum_{m \in \mathcal{M}} d_m \sum_{b \in \mathcal{IOB}} \left(c^{I_{l}}_{pibmy}  q^{I}_{pibmy} + \frac{1}{2} c^{I_{q}}_{pibmy}  \left(q^{I}_{pibmy}\right)^{2} \right) \\
				- \sum_{p \in \mathcal{P}} \sum_{i \in \mathcal{I}} \sum_{b \in \mathcal{IOB}} \frac{1}{ \| \Delta \|_{y}}  c^{\Delta^{I}}_{piby}  \Delta^{I}_{piby} \\
				- \sum_{p \in \mathcal{P}} \sum_{c \in \mathcal{C}} \sum_{o \in \mathcal{O}} \sum_{m \in \mathcal{M}} d_m  c^{P}_{pcoy} q^{P \rightarrow T}_{pcomy}\\
				- \sum_{p \in \mathcal{P}} \sum_{c \in \mathcal{C}} \sum_{o \in \mathcal{O}} \frac{1}{ \| \Delta \|_{y}} c^{\Delta P}_{pcoy} \Delta^{P}_{pcoy} \\
				- \sum_{v \in \mathcal{V}} \sum_{t \in \mathcal{T}} \sum_{(c,c') \in \mathcal{VT}} \sum_{o \in \mathcal{O}} \sum_{m \in \mathcal{M}} d_m c^{V}_{vcc'y}  q^{V}_{vtcc'omy} \\
				- \sum_{v \in \mathcal{V}} \sum_{(c,c') \in \mathcal{VT}} \frac{1}{ \| \Delta \|_{y}} c^{\Delta V}_{vcc'y} \Delta^{V}_{vcc'y} \\
				- \sum_{v \in \mathcal{V}} \sum_{((r,r'),(c,c')) \in \mathcal{RV}} \frac{1}{ \| \Delta \|_{y}} c^{\Delta^{RV}}_{vrr'cc'y} \Delta^{RV}_{vrr'cc'y}\\
				- \sum_{t \in \mathcal{T}} \sum_{ (a,c) \in \mathcal{AC} } \sum_{o \in \mathcal{O}} \sum_{m \in \mathcal{M}} d_m c^{A}_{acy}  q^{T}_{tacomy} \\
				- \sum_{ (a,c) \in \mathcal{AC} } \frac{1}{ \| \Delta \|_{y}} \frac{1}{2} c^{\Delta A}_{acy} \Delta^{A}_{acy} \\
				- \sum_{a \in \mathcal{A}} \sum_{(r,c) \in \mathcal{RA} | (a,r) \in \mathcal{AC} } \frac{1}{ \| \Delta \|_{y}} \frac{1}{2} c^{\Delta^{RA}}_{arcy} \Delta^{RA}_{arcy}\\
				- \sum_{s \in \mathcal{S}} \sum_{t \in \mathcal{T}} \sum_{c \in \mathcal{C}} \sum_{o \in \mathcal{O}} \sum_{m \in \mathcal{M}} d_{m} c^{S_{in}}_{scy} q^{S_{in}}_{stcomy} \\
				- \sum_{s \in \mathcal{S}} \sum_{t \in \mathcal{T}} \sum_{c \in \mathcal{C}} \sum_{o \in \mathcal{O}} \sum_{m \in \mathcal{M}} d_{m} c^{S_{out}}_{scy} q^{S_{out}}_{stcomy} \\
				- \sum_{s \in \mathcal{S}} \sum_{c \in \mathcal{C}} \frac{1}{ \| \Delta \|_{y}} c^{\Delta S}_{scy} \Delta^{S}_{scy}\\
				- \sum_{s \in \mathcal{S}} \sum_{(r,c) \in \mathcal{RS}} \frac{1}{ \| \Delta \|_{y}} c^{\Delta^{RS}}_{srcy} \Delta^{RS}_{srcy}
			\end{aligned} 
			\right] \\
\text{s.t.} \, 	& \sum_{o \in \mathcal{O}} \sum_{c \in \mathcal{C}} fi^{P}_{cio} q^{P \rightarrow T}_{pcomy} \leq \sum_{b \in \mathcal{IOB}} q^{I}_{pibmy}  & \begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ m \in \mathcal{M}, y \in \mathcal{Y} 
			\end{aligned} \quad &(\phi^{P}_{pimy}) & \\
			%
			& q^{I}_{pibmy}  \leq av^{I}_{pibm}
			\left( \begin{aligned}
				\Lambda^{I}_{piby} \\ + \sum_{ y' \in \mathcal{Y} | (y-L^{I}_{i} \leq y' < y ) }  \Delta^{I}_{piby}
			\end{aligned} 
			\right)   & \begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ b \in \mathcal{IOB}, \\ m \in \mathcal{M},  y \in \mathcal{Y}
			\end{aligned}  \quad &( \Lambda^{I}_{piby}) & \\
			%
			& q^{P \rightarrow T}_{pcomy} \leq \left( 
			\begin{aligned}
				\Lambda^{P}_{pcoy} \\ + \sum_{ y' \in \mathcal{Y} | (y-L^{P}_{co} \leq y' < y ) } \Delta^{P}_{pcoy} 
			\end{aligned} 
			\right)  & \begin{aligned}
				\forall p \in \mathcal{P}, c \in \mathcal{C}, \\ o \in \mathcal{O},  m \in \mathcal{M}, \\ y \in \mathcal{Y} 
			\end{aligned} \quad &(\lambda^{P}_{pcomy}) & \\
			%
			& \Delta^{P}_{pcoy} \leq \Omega^{P}_{pcoy}  & \begin{aligned}
				\forall p \in \mathcal{P}, c \in \mathcal{C},\\ o \in \mathcal{O}, y \in \mathcal{Y} 
			\end{aligned} \quad &(\omega^{P}_{pcoy}) & \\
			%
			& \sum_{ y' \in \mathcal{Y} | (y-L^{I}_{i} \leq y' < y ) } \Delta^{I}_{piby'} \leq \Omega^{I}_{piby}  & \begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ b \in \mathcal{IOB}, \\ y \in \mathcal{Y} 
			\end{aligned} \quad &(\omega^{I}_{piby}) & \\
			%
			&\begin{aligned}
				\left(\begin{aligned}
					\sum_{a \in \mathcal{A}_s(n) | (a,c) \in \mathcal{AC} } (1+l^{A}_{ac}) q^{T}_{tacomy} \\ 
					+ \sum_{b \in \mathcal{DSB}} q^{T \rightarrow D}_{tncbomy} \\
					+ \sum_{c' \in \mathcal{C} | (c,c') \in \mathcal{VT}}fi^{V}_{cc'} q^{V}_{v(n)tcc'omy} \\
					+ q^{S_{in}}_{s(n)tcomy}
				\end{aligned}\right) \\  \leq 
				\left(\begin{aligned}
					\sum_{a \in \mathcal{A}_e(n) | (a,c) \in \mathcal{AC} } q^{T}_{tacomy} \\ 
					+ \sum_{c' \in \mathcal{C} | (c',c) \in \mathcal{VT}}q^{V }_{v(n)tc'comy} \\
					+ \sum_{p \in \mathcal{P}(t,n)} q^{P \rightarrow T}_{pcomy} \\
					+ q^{S_{out}}_{s(n)tcomy}
				\end{aligned}\right) 
			\end{aligned} 
			& \begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C},   o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y} 
			\end{aligned} \quad &(\phi^{T}_{tncomy}) \\
			%
			& \sum_{m \in \mathcal{M}} d_{m} \sum_{b \in \mathcal{DSB}} q^{T \rightarrow D}_{tncbomy} \leq \Lambda^{T}_{tncoy}  & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C},  o \in \mathcal{O}, \\ y \in \mathcal{Y}
			\end{aligned}
			\quad & (\lambda^{T}_{tncoy}) \\
			%
			& \begin{aligned} \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}} q^{V}_{vtcc'omy} \\ \leq \left( 
				\begin{aligned}
					\Lambda^{V}_{vcc'y}\\ 
					+ \sum_{y' \in \mathcal{Y} | y-L^{V}_{cc'} \leq y' < y } \Delta^{V}_{vcc'y} \\
					+ \sum_{(r,r') | ((r,r'),(cc')) \in \mathcal{RV}} \sum_{ y' \in \mathcal{Y} | y-L^{V}_{cc'} \leq y'< y} f^{RV}_{rr'cc'} \Delta^{RV}_{vrr'cc'y}\\ 
					- \sum_{(r,r') | ((cc'),(r,r')) \in \mathcal{RV}} \sum_{ y' \in \mathcal{Y} | y'< y}  \Delta^{RV}_{vcc'rr'y}
				\end{aligned} 
				\right) \end{aligned}   & 
			\begin{aligned}
				\forall v \in \mathcal{V}, \\ (c,c') \in \mathcal{VT}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned}
			\quad & (\lambda^{V}_{vcdsy}) \\
			%
			& \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}}q^{T}_{tacomy} \leq \left( 
			\begin{aligned}
				\Lambda^{A}_{acy} \\ 
				+ \sum_{ y' \in \mathcal{Y} | y-L^{A}_{c} \leq y'< y} \Delta^{A}_{acy}\\ 
				+ \sum_{r | (r,c) \in \mathcal{RA}} \sum_{ y' \in \mathcal{Y} | y-L^{A}_{c} \leq y'< y} f^{RA}_{rc} \Delta^{RA}_{arcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RA}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RA}_{acry}
			\end{aligned} 
			\right)    & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} ,\\ m \in \mathcal{M}, y \in \mathcal{Y} \\
			\end{aligned} \quad & (\lambda^{A}_{acmy}) \\
			%
			& \Delta^{A}_{acy} =  \Delta^{A}_{a^{-1}(a)cy}  \quad & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} , \\  y \in \mathcal{Y}
			\end{aligned}
			\quad & (\delta^{A}_{acy}) \\
			%
			& \Delta^{RA}_{arcy} = \Delta^{RA}_{a^{-1}(a)rcy} \quad & 
			\begin{aligned}
				\forall a \in \mathcal{A}, \\ (r,c) \in \mathcal{RA}, \\  (a,r) \in \mathcal{AC}, \\y \in \mathcal{Y}
			\end{aligned}
			\quad & (\delta^{RA}_{arcy}) \\
			%
			& \begin{aligned}
				\sum_{o \in \mathcal{O}}  \sum_{t \in \mathcal{T}} q^{S}_{stcomy} \\ \quad \leq 
				\left( 
				\begin{aligned}
					\Lambda^{S}_{scy} \\ + \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'<y} \Delta^{S}_{scy}\\
					+ \sum_{r | (r,c) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'< y} f^{RS}_{rc} \Delta^{RS}_{srcy}\\ 
					- \sum_{r | (c,r) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RS}_{scry}
				\end{aligned} 
				\right) 
			\end{aligned}
			& 
			\begin{aligned}
				\forall s \in \mathcal{S}, c \in \mathcal{C}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} 
			\quad & (\lambda^{S}_{scmy}) \\
			%
			& \begin{aligned}
				q^{S}_{stcom^{+}(m)y} \\ \quad \leq 
				\left(1- l^{S}_{cmm^{+}(m)} \right) \cdot \left[
				\begin{aligned}
					q^{S}_{stcomy} \\ + d_{m} \left(q^{S_{in}}_{stcomy} - q^{S_{out}}_{stcomy}\right) 
				\end{aligned}\right] 
			\end{aligned}
			& 
			\begin{aligned}
				\forall s \in \mathcal{S}, t \in \mathcal{T}, \\ c \in \mathcal{C}, o \in \mathcal{O},\\  m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} 
			\quad & (\phi^{S}_{stcomy}) \\
			%
			& \left( 
			\begin{aligned}
				\sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'<y} \Delta^{S}_{scy}\\
				+ \sum_{r | (r,c) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'< y} f^{RS}_{rc} \Delta^{RS}_{srcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RS}_{scry}
			\end{aligned} 
			\right) 
			\leq \Omega^{S}_{scy}  & \begin{aligned}
				\forall s \in \mathcal{S}, c \in \mathcal{C}, \\ y \in \mathcal{Y}
			\end{aligned}  \quad &(\omega^{S}_{scy}) & \\
			%
			& \left( \begin{aligned}
				q^{I}_{pibmy}, q^{P \rightarrow T}_{pcomy}, \Delta^{I}_{piby}, \Delta^{P}_{pcoy}, q^{T \rightarrow D}_{tncbomy}, \\ q^{V}_{vtcc'omy}, \Delta^{V}_{vcc'y}, \Delta^{RV}_{vrr'cc'y}, q^{T}_{tacomy}, \Delta^{A}_{acy}, \\\Delta^{RA}_{arcy}, q^{S}_{stcomy}, q^{S_{in}}_{stcomy}, q^{S_{out}}_{stcomy}, \Delta^{S}_{scy}, \Delta^{RS}_{scry}
			\end{aligned} \right) \geq 0 \quad & \quad\quad\quad\quad\quad\quad\quad& \quad\quad\quad\quad\quad\quad\quad \\
\end{aligned}
``` 
