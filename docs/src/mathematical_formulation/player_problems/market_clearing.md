# Market Clearing

```math
\begin{aligned}	
\left[\begin{aligned}
				q^{P \rightarrow T}_{p(n)comy} - q^{T \leftarrow P}_{t(n)ncomy}
			\end{aligned}\right]  \geq 0 & \perp \pi^{P}_{ncomy} \geq 0 & 
			\begin{aligned}
				\forall n \in \mathcal{N}, c \in \mathcal{C}, \\o \in \mathcal{O},  m \in \mathcal{M}, \\ y \in \mathcal{Y}
			\end{aligned} 
		\\
			\left[\begin{aligned}
				\pi^{T \rightarrow D}_{ncbmy} - \tilde{P}^{T \rightarrow D}_{ncbmy}\biggl( \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}}q^{T \rightarrow D}_{tncbomy}\biggr)
			\end{aligned}\right]
			\geq 0 & \perp \pi^{T \rightarrow D}_{ncmy}  \geq 0 & 
			\begin{aligned}
				\forall n \in \mathcal{N}, c \in \mathcal{C}, \\ b \in \mathcal{DSB},  m \in \mathcal{M}, \\ y \in \mathcal{Y}
			\end{aligned} 
		\\
			\left[\begin{aligned}
				\sum_{c' \in \mathcal{C} | (c,c') \in \mathcal{VT}}fi^{V}_{cc'} q^{V}_{v(n)tcc'omy} - q^{T \rightarrow V}_{tncomy}
			\end{aligned}\right]
			\geq 0 & \perp \pi^{T \rightarrow V}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} 
		\\
			\left[\begin{aligned}
				\sum_{c \in \mathcal{C} | (cc') \in \mathcal{VT}}q^{V }_{v(n)tcc'omy} - q^{T \leftarrow V}_{tncomy}
			\end{aligned}\right]
			\geq 0 & \perp \pi^{V \rightarrow T}_{tncomy}  \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c' \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} 
		\\
			\left[\begin{aligned}
				q^{A}_{acmy} - \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}}q^{T}_{tacomy}
			\end{aligned}\right]
			\geq 0 & \perp \pi^{A}_{acmy} \geq 0 & 
			\begin{aligned}
				\forall (a,c) \in \mathcal{AC},  \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} 
		\\
			\left[\begin{aligned}
				q^{S_{in}}_{s(n)tcomy} -  q^{T \rightarrow S}_{tncomy}
			\end{aligned}\right]
			\geq 0 & \perp \pi^{T \rightarrow S}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C},  o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned} 
		\\
			\left[
			q^{S_{out}}_{s(n)tcomy} - q^{T \leftarrow S}_{tncomy}
			\right]
			\geq 0 & \perp \pi^{S \rightarrow T}_{tncomy} \geq 0 & 
			\begin{aligned}
				\forall t \in \mathcal{T}, n \in \mathcal{N}, \\ c \in \mathcal{C}, o \in \mathcal{O}, \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned}
\end{aligned}
``` 
