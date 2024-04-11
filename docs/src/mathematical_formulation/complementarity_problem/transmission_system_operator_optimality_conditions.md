# Transmission System Operator Optimality Conditions
```math
\begin{aligned}	
\left[\begin{aligned}
				r_{y} d_{m}
				\left(\begin{aligned}
					- \pi^{A}_{acmy} + c^{A}_{acy}
				\end{aligned} \right) 
				+ \lambda^{A}_{acmy}
			\end{aligned}\right]
			\geq 0 & \perp q^{A}_{acmy} \geq 0 & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} , \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\frac{r_{y}}{ \| \Delta \|_{y}} \frac{1}{2} c^{\Delta A}_{acy} \\ - \sum_{ y' \in \mathcal{Y} | (y < y' \leq y + L^{A}_{c})} \sum_{m \in \mathcal{M}} \lambda^{A}_{acmy'} \\
				+ \delta^{A}_{acy} -  \delta^{A}_{a^{-1}(a)cy}
			\end{aligned} \right]
			\geq 0 & \perp \Delta^{A}_{acy}  \geq 0 & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\frac{r_{y}}{ \| \Delta \|_{y}} \frac{1}{2} c^{\Delta^{RA}}_{arcy} \\ - \sum_{ y' \in \mathcal{Y} | (y < y' \leq y +L^{A}_{c})} \sum_{m \in \mathcal{M}} f^{RA}_{rc} \lambda^{A}_{acmy'} \\  + \sum_{ y' \in \mathcal{Y} | y'> y} \sum_{m \in \mathcal{M}} \lambda^{A}_{army'} \\
				\delta^{RA}_{arcy} - \delta^{RA}_{a^{-1}(a)rcy}
			\end{aligned} \right]
			\geq 0 & \perp \Delta^{RA}_{arcy}  \geq 0 & 
			\begin{aligned}
				\forall a \in \mathcal{A}, (r,c) \in \mathcal{RA}, \\  (a,r) \in \mathcal{AC}, \\y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[
			\begin{aligned}
				\Lambda^{A}_{acy} \\ 
				+ \sum_{ y' \in \mathcal{Y} | y-L^{A}_{c} \leq y'< y} \Delta^{A}_{acy}\\ 
				+ \sum_{r | (r,c) \in \mathcal{RA}} \sum_{ y' \in \mathcal{Y} | y-L^{A}_{c} \leq y'< y} f^{RA}_{rc} \Delta^{RA}_{arcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RA}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RA}_{acry} \\
				- q^{A}_{acmy}
			\end{aligned} 
			\right]
			\geq 0 & \perp \lambda^{A}_{acmy} \geq 0 & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} , \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[
			\begin{aligned}
				\Delta^{A}_{acy} -  \Delta^{A}_{a^{-1}(a)cy}
			\end{aligned} 
			\right]
			= 0 & \perp \delta^{A}_{acy}  & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} , \\  y \in \mathcal{Y}
			\end{aligned}\\
			%
			\left[
			\begin{aligned}
				\Delta^{RA}_{arcy} - \Delta^{RA}_{a^{-1}(a)rcy}
			\end{aligned} 
			\right]
			= 0 & \perp \delta^{RA}_{arcy}  & 
			\begin{aligned}
				\forall a \in \mathcal{A}, (r,c) \in \mathcal{RA}, \\  (a,r) \in \mathcal{AC}, \\y \in \mathcal{Y}
			\end{aligned}\\
\end{aligned}
``` 
