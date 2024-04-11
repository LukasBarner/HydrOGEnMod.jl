# Storage System Operator

```math
\begin{aligned}	
\max_{\substack{q^{S}_{stcomy}, \\ q^{S_{in}}_{stcomy}, \\ q^{S_{out}}_{stcomy}, \\ \Delta^{S}_{scy}, \\ \Delta^{RS}_{srcy}}}  \quad &
			%
			\sum_{y \in \mathcal{Y}} r_{y} \left[
			\begin{aligned}
				\sum_{c \in \mathcal{C}}
				\left(
				\begin{aligned} \sum_{m \in \mathcal{M}}  \sum_{t \in \mathcal{T}} \sum_{o \in \mathcal{O}} 
					d_{m}
					\left[ \begin{aligned}
						\left(\pi^{S \rightarrow T}_{tn(s)comy} - c^{S_{out}}_{scy}  \right) q^{S_{out}}_{stcomy} \\  - \left( \pi^{T \rightarrow S}_{tn(s)comy} + c^{S_{in}}_{scy}  \right) q^{S_{in}}_{stcomy}
					\end{aligned} \right] \\
					- \frac{1}{ \| \Delta \|_{y}} c^{\Delta S}_{scy} \Delta^{S}_{scy} \\
				\end{aligned}
				\right) \\
				- \frac{1}{ \| \Delta \|_{y}} \sum_{(r,c) \in \mathcal{RS}} c^{\Delta^{RS}}_{srcy} \Delta^{RS}_{srcy}
			\end{aligned} \right] \\ 
\text{s.t.} \quad 	
			%
			& 
			\sum_{o \in \mathcal{O}}  \sum_{t \in \mathcal{T}} q^{S}_{stcomy}
			\leq 
			\left( 
			\begin{aligned}
				\Lambda^{S}_{scy} \\ + \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'<y} \Delta^{S}_{scy} \\
				+ \sum_{r | (r,c) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'< y} f^{RS}_{rc} \Delta^{RS}_{srcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RS}_{scry}
			\end{aligned} 
			\right)   \quad & 
			\begin{aligned}\forall c \in \mathcal{C}, m \in \mathcal{M} \\ y \in \mathcal{Y} \end{aligned}
			\quad & (\lambda^{S}_{scmy}) \\
			& \begin{aligned}
				\left(1- l^{S}_{cmm^{+}(m)} \right) \cdot \left[\begin{aligned}
					q^{S}_{stcomy} \\ + d_{m} \left(q^{S_{in}}_{stcomy} - q^{S_{out}}_{stcomy}\right)
				\end{aligned}\right] \\
				\geq  q^{S}_{stcom^{+}(m)y} 
			\end{aligned}
			\quad & \begin{aligned} \forall t \in \mathcal{T}, c \in \mathcal{C}, \\ o \in \mathcal{O}, m \in \mathcal{M} \\ y \in \mathcal{Y} \end{aligned} \quad &(\phi^{S}_{stcomy}) & \\
			& \left(\begin{aligned}
				\sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'<y} \Delta^{S}_{scy} \\
				+ \sum_{r | (r,c) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'< y} f^{RS}_{rc} \Delta^{RS}_{srcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RS}_{scry}
			\end{aligned} \right) \leq \Omega^{S}_{scy} \quad & \begin{aligned} \forall c \in \mathcal{C}, \\ y \in \mathcal{Y} \end{aligned} \quad &(\omega^{S}_{scy}) & \\
			& q^{S}_{stcomy}, q^{S_{in}}_{stcomy}, q^{S_{out}}_{stcomy}, \Delta^{S}_{scy}, \Delta^{RS}_{srcy}  \geq 0 \quad & & 
\end{aligned}
```