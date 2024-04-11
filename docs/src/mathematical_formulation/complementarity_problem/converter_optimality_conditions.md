# Converter Optimality Conditions
```math
\begin{aligned}	
\left[\begin{aligned}
				r_{y} d_{m}
				\left(\begin{aligned}
					-\pi^{V \rightarrow T}_{tnc'omy} + fi^{V}_{cc'} \pi^{T \rightarrow V}_{tncomy} + c^{V}_{vcc'y} 
				\end{aligned} \right) \\
				+ \lambda^{V}_{vcc'my}
			\end{aligned}\right]
			\geq 0 & \perp q^{V}_{vtcc'omy} \geq 0 & 
			\begin{aligned}
				\forall v \in \mathcal{V}, t \in \mathcal{T}, \\ (c,c') \in \mathcal{VT}, \\ o \in \mathcal{O}, m \in \mathcal{M}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left(\begin{aligned}
				\frac{r_{y} }{ \| \Delta \|_{y}} c^{\Delta V}_{vcc'y} \\-\sum_{y' \in \mathcal{Y} | (y < y' \leq y +L^{V}_{cc'})} \sum_{m \in \mathcal{M}} \lambda^{V}_{vcc'my'}
			\end{aligned}\right)
			\geq 0 & \perp \Delta^{V}_{vcc'y} \geq 0 & 
			\begin{aligned}
				\forall v \in \mathcal{V}, \\ (c,c') \in \mathcal{VT}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left(\begin{aligned}
				\frac{r_{y} }{ \| \Delta \|_{y}} c^{\Delta^{RV}}_{vrr'cc'y} \\ -\sum_{y' \in \mathcal{Y} | (y < y' \leq y + L^{V}_{cc'})} \sum_{m \in \mathcal{M}} f^{RV}_{rr'cc'} \lambda^{V}_{vcc'my'} \\ + \sum_{y' \in \mathcal{Y} |(y' > y) } \sum_{m \in \mathcal{M}} \lambda^{V}_{vrr'my'}  
			\end{aligned}\right)
			\geq 0 & \perp \Delta^{RV}_{vrr'cc'y} \geq 0 & 
			\begin{aligned}
				\forall v \in \mathcal{V}, \\ (c,c') \in \mathcal{VT}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left( 
			\begin{aligned}
				\Lambda^{V}_{vcc'y}\\ 
				+ \sum_{y' \in \mathcal{Y} | y-L^{V}_{cc'} \leq y' < y } \Delta^{V}_{vcc'y} \\
				+ \sum_{(r,r') | ((r,r'),(cc')) \in \mathcal{RV}} \sum_{ y' \in \mathcal{Y} | y-L^{V}_{cc'} \leq y'< y} f^{RV}_{rr'cc'} \Delta^{RV}_{vrr'cc'y}\\ 
				- \sum_{(r,r') | ((cc'),(r,r')) \in \mathcal{RV}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RV}_{vcc'rr'y} \\
				- \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}} q^{V}_{vtcc'omy}
			\end{aligned} 
			\right) 
			\geq 0 & \perp \lambda^{V}_{vcc'my} \geq 0 & 
			\begin{aligned}
				\forall v \in \mathcal{V}, \\ (c,c') \in \mathcal{VT}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\ 
\end{aligned}
``` 
