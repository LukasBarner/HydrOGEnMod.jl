# Storage System Operator Optimality Conditions
```math
\begin{aligned}	
\left[\begin{aligned} 
				\lambda^{S}_{scmy} \\
				- \left(1- l^{S}_{cmm^{+}(m)} \right) \phi^{S}_{stcomy} \\
				+ \phi^{S}_{stcom^{-}(m)y} \\
			\end{aligned}\right]
			\geq 0 & \perp q^{S}_{stcomy}  \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, t \in \mathcal{T}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				r_{y} d_{m} \left( \pi^{T \rightarrow S}_{tn(s)comy} + c^{S_{in}}_{scy}  \right) \\
				- \left(1- l^{S}_{cmm^{+}(m)} \right) d_{m} \phi^{S}_{stcomy}
			\end{aligned}\right]
			\geq 0 & \perp q^{S_{in}}_{stcomy}  \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, t \in \mathcal{T}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				- r_{y} d_{m} \left(\pi^{S \rightarrow T}_{tn(s)comy} - c^{S_{out}}_{scy}  \right) \\
				+ \left(1- l^{S}_{cmm^{+}(m)} \right) d_{m} \phi^{S}_{stcomy}
			\end{aligned}\right]
			\geq 0 & \perp q^{S_{out}}_{stcomy} \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, t \in \mathcal{T}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned} 
				\frac{r_{y}}{ \| \Delta \|_{y}} c^{\Delta S}_{scy} \\ - \sum_{ y' \in \mathcal{Y} | (y < y' \leq y +L^{S}_{c} )} \sum_{m \in \mathcal{M}} \lambda^{S}_{scmy'} \\ + \sum_{ y' \in \mathcal{Y} | (y < y' \leq y +L^{S}_{c} )} \omega^{S}_{scy'}
			\end{aligned}\right]
			\geq 0 & \perp \Delta^{S}_{scy} \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, c \in \mathcal{C}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned} 
				\frac{r_{y}}{ \| \Delta \|_{y}} c^{\Delta^{RS}}_{srcy} \\ - \sum_{ y' \in \mathcal{Y} |(y < y' \leq y +L^{S}_{c} )} \sum_{m \in \mathcal{M}} f^{RS}_{rc} \lambda^{S}_{scmy'} \\ + \sum_{ y' \in \mathcal{Y} | y' > y} \sum_{m \in \mathcal{M}} \lambda^{S}_{srmy'} \\ + \sum_{ y' \in \mathcal{Y} |(y < y' \leq y +L^{S}_{c} )} f^{RS}_{rc} \omega^{S}_{scy'} \\ - \sum_{ y' \in \mathcal{Y} | y' > y} \omega^{S}_{sry'}
			\end{aligned}\right]
			\geq 0 & \perp \Delta^{RS}_{srcy} \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, \\ (r,c) \in \mathcal{RS}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[ 
			\begin{aligned}
				\Lambda^{S}_{scy} \\ + \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'<y} \Delta^{S}_{scy} \\
				+ \sum_{r | (r,c) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'< y} f^{RS}_{rc} \Delta^{RS}_{srcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RS}_{scry} \\
				- \sum_{o \in \mathcal{O}}  \sum_{t \in \mathcal{T}}  q^{S}_{stcomy}  
			\end{aligned} 
			\right]
			\geq 0 & \perp \lambda^{S}_{scmy} \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, c \in \mathcal{C}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[ 
			\begin{aligned}
				\left(1- l^{S}_{cmm^{+}(m)} \right) \cdot \left(\begin{aligned}
					q^{S}_{stcomy} \\ + d_{m} \left(q^{S_{in}}_{stcomy} - q^{S_{out}}_{stcomy}\right) 
				\end{aligned}\right) \\
				- q^{S}_{stcom^{+}(m)y}
			\end{aligned} 
			\right]
			\geq 0 & \perp \phi^{S}_{stcomy} \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, t \in \mathcal{T}, \\ c \in \mathcal{C},  o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y} 
			\end{aligned} \\
			%
			\left[ 
			\begin{aligned}
				\Omega^{S}_{scy} \\ - \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'<y} \Delta^{S}_{scy} \\
				- \sum_{r | (r,c) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y-L^{S}_{c} \leq y'< y} f^{RS}_{rc} \Delta^{RS}_{srcy}\\ 
				+ \sum_{r | (c,r) \in \mathcal{RS}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RS}_{scry} 
			\end{aligned} 
			\right]
			\geq 0 & \perp \omega^{S}_{scy} \geq 0 & 
			\begin{aligned}
				\forall s \in \mathcal{S}, c \in \mathcal{C}, \\ y \in \mathcal{Y}
			\end{aligned} \\ 
\end{aligned}
``` 