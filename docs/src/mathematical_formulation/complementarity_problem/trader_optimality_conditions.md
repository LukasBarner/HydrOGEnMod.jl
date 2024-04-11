# Trader Optimality Conditions
```math
\begin{aligned}	
\left[r_{y} d_{m}
			\begin{aligned}
				\left(\begin{aligned}
					-{1}^{NC}_{tnc} \cdot \frac{\partial\tilde{P}^{T \rightarrow D}_{ncbmy}\biggl(Q^{T \rightarrow D}_{ncbmy}\biggr)}{\partial q^{T \rightarrow D}_{tncbomy} } \cdot q^{T \rightarrow D}_{tncbomy}  \\ 
					- {1}^{NC}_{tnc} \cdot \tilde{P}^{T \rightarrow D}_{ncbmy}\biggl(Q^{T \rightarrow D}_{ncbmy}\biggr) \\ 
					-  \left( 1 - {1}^{NC}_{tnc} \right) \cdot \pi^{T \rightarrow D}_{ncbmy} \\
				\end{aligned}\right) \\
				+ \phi^{T}_{tncomy} + d_{m}  \lambda^{T}_{tncoy}
			\end{aligned} \right]
			\geq 0 & \perp q^{T \rightarrow D}_{tncbomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, b \in \mathcal{DSB}, \\ o \in \mathcal{O}, m \in \mathcal{M}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				r_{y} d_{m}
				\left(\begin{aligned}
					\pi^{P}_{ncomy} \end{aligned}\right) - \phi^{T}_{tncomy} 
			\end{aligned}\right]
			\geq 0 & \perp q^{T \leftarrow P}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}_p(t), \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\phi^{T}_{tncomy} - r_{y} d_{m}
				\left(\begin{aligned}
					\pi^{T \rightarrow V}_{tncomy}
				\end{aligned}\right)
			\end{aligned}\right]
			\geq 0 & \perp q^{T \rightarrow V}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}, 
			\end{aligned} \\
			%
			\left[\begin{aligned}
				r_{y} d_{m}
				\left(\begin{aligned}
					\pi^{V \rightarrow T}_{tncomy} 	\end{aligned}\right) - \phi^{T}_{tncomy} 
			\end{aligned}\right]
			\geq 0 & \perp q^{T \leftarrow V}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\phi^{T}_{tncomy}  - r_{y} d_{m}
				\left(\begin{aligned}
					\pi^{T \rightarrow S}_{tncomy}
				\end{aligned}\right)
			\end{aligned}\right]
			\geq 0 & \perp q^{T \rightarrow S}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y} 
			\end{aligned} \\
			%	
			\left[\begin{aligned}
				r_{y} d_{m}
				\left(\begin{aligned}
					\pi^{S \rightarrow T}_{tncomy} 	\end{aligned}\right) - \phi^{T}_{tncomy}
			\end{aligned}\right]
			\geq 0 & \perp q^{T \leftarrow S}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				r_{y} d_{m} \pi^{A}_{acmy} \\ + \sum_{n \in \mathcal{N} | a \in \mathcal{A}_s(n)} (1+l^{A}_{ac}) \phi^{T}_{tncomy} \\ - \sum_{n \in \mathcal{N} | a \in \mathcal{A}_e(n)} \phi^{T}_{tncomy}
			\end{aligned}\right]
			\geq 0 & \perp q^{T}_{tacomy} \geq 0 &
			\begin{aligned}
				\forall t \in \mathcal{T}, o \in \mathcal{O}, \\  (a,c) \in \mathcal{AC} , \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\sum_{a \in \mathcal{A}_e(n) | (a,c) \in \mathcal{AC} } q^{T}_{tacomy} \\ 
				+ \sum_{n \in \mathcal{N}_p(t)} q^{T \leftarrow P}_{tncomy} \\
				+ q^{T \leftarrow V}_{tncomy} \\
				+ q^{T \leftarrow S}_{tncomy} \\ 
				- \sum_{a \in \mathcal{A}_s(n) | (a,c) \in \mathcal{AC} } (1+l^{A}_{ac}) q^{T}_{tacomy} \\ 
				- \sum_{b \in \mathcal{DSB}} q^{T \rightarrow D}_{tncbomy}\\
				- q^{T \rightarrow V}_{tncomy} \\
				- q^{T \rightarrow S}_{tncomy}
			\end{aligned}\right]
			\geq 0 & \perp \phi^{T}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\Lambda^{T}_{tncoy} - \sum_{m \in \mathcal{M}} d_{m} \sum_{b \in \mathcal{DSB}} q^{T \rightarrow D}_{tncbomy}
			\end{aligned}\right]
			\geq 0 & \perp \lambda^{T}_{tncoy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ y \in \mathcal{Y}
			\end{aligned} \\ 
\end{aligned}
```
