# Producer Optimality Conditions
```math
\begin{aligned}	
\left(\begin{aligned}
				r_{y} d_{m} \left(c^{I_{l}}_{pibmy} + c^{I_{q}}_{pibmy} q^{I}_{pibmy} \right) \\ - \phi^{P}_{pimy} + \Lambda^{I}_{piby}
			\end{aligned}\right)
			\geq 0 & \perp q^{I}_{pibmy} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ b \in \mathcal{IOB}, m \in \mathcal{M},\\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left(\begin{aligned}
				r_{y} d_{m} \left(-\pi^{P}_{n(p)comy} + c^{P}_{pcoy}\right) \\ + \sum_{i \in \mathcal{I}} fi^{P}_{cio} \phi^{P}_{pisy} + \lambda^{P}_{pcomy}
			\end{aligned}\right)
			\geq 0 & \perp q^{P \rightarrow T}_{pcomy} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, c \in \mathcal{C}, \\ o \in \mathcal{O}, m \in \mathcal{M}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\frac{r_{y}}{ \| \Delta \|_{y}} c^{\Delta^{I}}_{piby}  \\ - \sum_{ y' \in \mathcal{Y} | (y < y' \leq y+L^{I}_{i} ) } \sum_{m \in \mathcal{M}} av^{I}_{pibm} \lambda^{I}_{pibmy'} \\ + \sum_{ y' \in \mathcal{Y} | (y < y' \leq y + L^{I}_{i}  ) } \omega^{I}_{piby'} 
			\end{aligned}\right]
			\geq 0 & \perp \Delta^{I}_{piby} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ b \in \mathcal{IOB}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left(\begin{aligned}
				\frac{r_{y}}{ \| \Delta \|_{y}} c^{\Delta P}_{pcoy} \\ - \sum_{y' \in \mathcal{Y} | (y < y' \leq y + L^{P}_{co})} \sum_{m \in \mathcal{M}}\lambda^{P}_{pcomy'} + \omega^{P}_{pcoy}
			\end{aligned}\right)
			\geq 0 & \perp \Delta^{P}_{pcoy} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, c \in \mathcal{C}, \\ o \in \mathcal{O}, y \in \mathcal{Y}
			\end{aligned} \\
			% 
			\left(\begin{aligned}
				\sum_{b \in \mathcal{IOB}} q^{I}_{pibmy} - \sum_{o \in \mathcal{O}} \sum_{c \in \mathcal{C}} fi^{P}_{cio} q^{P \rightarrow T}_{pcomy}
			\end{aligned}\right)
			\geq 0 & \perp \phi^{P}_{pimy} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ m \in \mathcal{S}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				av^{I}_{pibm}
				\left( \begin{aligned}
					\sum_{ y' \in \mathcal{Y} | (y-L^{I}_{i} \leq y' < y ) }  \Delta^{I}_{piby} \\ + \Lambda^{I}_{piby}
				\end{aligned} \right) \\ - q^{I}_{pibmy}
			\end{aligned}\right]
			\geq 0 & \perp \Lambda^{I}_{piby} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ b \in \mathcal{IOB}, m \in \mathcal{S}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left[\begin{aligned}
				\left( \begin{aligned}
					\sum_{ y' \in \mathcal{Y} | (y-L^{P}_{co} \leq y' < y ) } \Delta^{P}_{pcoy} \\ + \Lambda^{P}_{pcoy} 
				\end{aligned} \right) \\ - q^{P \rightarrow T}_{pcomy}
			\end{aligned}\right]
			\geq 0 & \perp \lambda^{P}_{pcomy} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, c \in \mathcal{C}, \\ o \in \mathcal{O}, m \in \mathcal{M}, \\ y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left(\begin{aligned}
				\Omega^{P}_{pcoy} - \Delta^{P}_{pcoy} 
			\end{aligned}\right)
			\geq 0 & \perp \omega^{P}_{pcoy} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, c \in \mathcal{C}, \\ o \in \mathcal{O}, y \in \mathcal{Y}
			\end{aligned} \\
			%
			\left(\begin{aligned}
				\Omega^{I}_{piby} - \sum_{ y' \in \mathcal{Y} | (y-L^{I}_{i} \leq y' < y ) }  \Delta^{I}_{piby'}
			\end{aligned}\right)
			\geq 0 & \perp \omega^{I}_{piby} \geq 0 & 
			\begin{aligned}
				\forall p \in \mathcal{P}, i \in \mathcal{I}, \\ b \in \mathcal{IOB}, y \in \mathcal{Y}
			\end{aligned} \\
\end{aligned}
``` 
