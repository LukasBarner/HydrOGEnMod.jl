# Parameters

|Parameter | Explanation |
|--- | --- |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | Scaling of investment costs by the number of modeled years.  |
|$${1}^{NC}_{tnc}$$ | Factor indicating if trader $$t$$ is able to effectively withhold quantities of commodity $$c$$ in node $$n$$. If set to 1, Nash-Cournot behavior is assumed in the respective node, while a value of 0 implies perfectly competitive behavior (or equivalent regulation). If a conjectural variation approach is assumed, values in between may be taken. |
|$$av^{I}_{pibm}$$ | Availability of input $$i$$ in block $$b$$ during time step $$m$$. |
|$$r_{y}$$ | Discount factor indicating temporal preferences with respect to yearly profits. Preferences are assumed to be consistent between players. |
|$$d_{m}$$ | Weighting factor in time step $$m$$. Can be used to model aggregation. |
|$$c^{\Delta^{I}}_{piby}$$ | Cost coefficient of producer $$p$$ for input expansion of $$i$$ belonging to block $$b$$ in year $$y$$. |
|$$c^{I_{l}}_{pibmy}$$ | Linear operational cost coefficient of producer $$p$$ for input $$i$$ belonging to block $$b$$ in time step $$m$$ of year $$y$$. |
|$$c^{I_{q}}_{pibmy}$$ | Quadratic cost coefficient of producer $$p$$ for input $$i$$ belonging to block $$b$$ in time step $$m$$ of year $$y$$. |
|$$c^{P}_{pcoy}$$ | Production cost of producer $$p$$ for commodity $$c$$ of origin $$o$$ in year $$y$$. |
|$$c^{\Delta P}_{pcoy}$$ | Unit cost for expanding producer $$p$$'s production capacity of commodity $$c$$ in year $$y$$. |
|$$fi^{P}_{cio}$$ | Factor intensity. Indicates how many units of input $$i$$ are used to produce one unit of commodity $$c$$ for origin $$o$$. |
|$$L^{I}_{i}$$ | Lifetime of capacity investments into input procurement. |
|$$L^{P}_{co}$$ | Lifetime of technology used to produce commodity $$c$$ from origin $$o$$. |
|$$\Lambda^{P}_{pcoy}$$ | Exogenous capacity of producer $$p$$ to produce commodity $$c$$ from origin $$o$$. |
|$$\Lambda^{I}_{piby}$$ | Exogenous capacity of producer $$p$$ for input $$i$$ in time step $$m$$ of year $$y$$. |
|$$\Lambda^{T}_{tncoy}$$ | Maximum quantity of commodity $$c$$ from origin $$o$$ sold in year $$y$$ by trader $$t$$ in node $$n$$. |
|$$\Omega^{I}_{piby}$$| Capacity expansion restriction for input $$i$$ to block $$b$$ of producer $$p$$ in year $$y$$. |
|$$\Omega^{P}_{pcoy}$$| Capacity expansion restriction for commodity $$c$$ from origin $$o$$ of producer $$p$$ in year $$y$$. |
|$$fi^{V}_{cc'}$$| Factor intensity indicating how much of commodity $$c$$ is used in when converting to commodity $$c'$$. |
|$$l^{A}_{ac}$$| Loss for transporting commodity $$c$$ on arc $$a$$. |
|$$c^{V}_{vcc'y}$$| Cost of converter $$v$$ to convert commodity $$c$$ to commodity $$c'$$ in $$y$$. |
|$$c^{\Delta V}_{vcc'y}$$| Cost of converter $$v$$ to extend conversion capacity from $$c$$ to $$c'$$ in $$y$$. |
|$$c^{\Delta^{RV}}_{vrr'cc'y}$$ | Cost of repurposing conversion capacity $$(r,r')$$ to $$(c,c')$$. |
|$$f^{RV}_{rr'cc'}$$ | Factor indicating how much conversion capacity for $$cc'$$ is created when one unit of conversion capacity $$rr'$$ is repurposed. |
|$$\Lambda^{V}_{vcc'y}$$| Exogenous conversion capacity of converter $$v$$ from $$c$$ to $$c'$$ in year $$y$$. |
|$$L^{V}_{cc'}$$ | Lifetime of endogenously added conversion capacity from $$c$$ to $$c'$$. |
|$$c^{A}_{acy}$$ | Unit cost for transporting commodity $$c$$ along arc $$a$$ in year $$y$$. |
|$$c^{\Delta A}_{acy}$$ | Cost for expanding transport capacity of commodity $$c$$ along arc $$a$$ in year $$y$$. |
|$$c^{\Delta^{RA}}_{arcy}$$ | Cost for repurposing transport capacity of commodity $$r$$ to $$c$$. |
|$$f^{RA}_{rc}$$ | Factor indicating how much transport capacity of $$c$$ is created when one unit of capacity for $$r$$ is repurposed. |
|$$\Lambda^{A}_{acy}$$ | Exogenous transport capacity of commodity $$c$$ on arc $$a$$. |
|$$L^{A}_{c}$$ | Lifetime of endogenously added transport capacity of commodity $$c$$. |
|$$l^{S}_{scmm^{+}(m)}$$ | Storage losses of storage system operator $$s$$ when storing commodity $$c$$ from time step $$m$$ to $$m^{+}(m)$$ during year $$y$$. |
|$$c^{S_{in}}_{scy}$$ | Storage costs of storage system operator $$s$$ when injecting commodity $$c$$ in year $$y$$. |
|$$c^{S_{out}}_{scy}$$ | Storage costs of storage system operator $$s$$ when extracting commodity $$c$$ in year $$y$$. |
|$$c^{\Delta S}_{scy}$$ | Storage capacity expansion costs of storage system operator $$s$$ for commodity $$c$$ in year $$y$$. |
|$$c^{\Delta^{RS}}_{srcy}$$ | Cost of repurposing storage capacity from $$r$$ to $$c$$. |
|$$f^{RS}_{rc}$$ | Factor indicating how much storage capacity of $$c$$ is created when one unit of capacity for $$r$$ is repurposed. |
|$$\Lambda^{S}_{scy}$$ | Exogenous storage capacity of storage system operator $$s$$ for commodity $$c$$ in year $$y$$. |
|$$\Omega^{S}_{scy}$$ | Storage capacity expansion restriction of storage system operator $$s$$ for commodity $$c$$ in year $$y$$. |
|$$L^{S}_{c}$$ | Technology lifetime for storage of commodity $$c$$. |
