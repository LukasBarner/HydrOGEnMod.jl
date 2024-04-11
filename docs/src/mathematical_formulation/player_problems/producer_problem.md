# Producer
```math
\begin{aligned}
			\max_{\substack{q^{I}_{pibmy}, \\ q^{P \rightarrow T}_{pcomy}, \\ \Delta^{I}_{piby}, \\ \Delta^{P}_{pcoy}}}  \quad & \sum_{y \in \mathcal{Y}} r_{y} \left[ 
			\begin{aligned}\sum_{m \in \mathcal{M}} d_m \left(
				\begin{aligned}
					\sum_{o \in \mathcal{O}} \sum_{c \in \mathcal{C}} \left(\pi^{P}_{n(p)comy} - c^{P}_{pcoy} \right) q^{P \rightarrow T}_{pcomy} \\
					- \sum_{i \in \mathcal{I}} \sum_{b \in \mathcal{IOB}} \left(c^{I_{l}}_{pibmy}  q^{I}_{pibmy} + \frac{1}{2} c^{I_{q}}_{pibmy}  \left(q^{I}_{pibmy}\right)^{2} \right)
				\end{aligned} 
				\right) \\ 
				- \sum_{i \in \mathcal{I}} \sum_{b \in \mathcal{IOB}} \frac{1}{ \| \Delta \|_{y}}  c^{\Delta^{I}}_{piby}  \Delta^{I}_{piby} \\
				- \sum_{c \in \mathcal{C}} \sum_{o \in \mathcal{O}} \frac{1}{ \| \Delta \|_{y}} c^{\Delta P}_{pcoy} \Delta^{P}_{pcoy}
			\end{aligned} \right] 
\\
\text{s.t.} \quad 	& \sum_{o \in \mathcal{O}} \sum_{c \in \mathcal{C}} fi^{P}_{cio} q^{P \rightarrow T}_{pcomy} \leq \sum_{b \in \mathcal{IOB}} q^{I}_{pibmy} \quad &\begin{aligned}
				\forall i \in \mathcal{I}, \\ m \in \mathcal{M},  y \in \mathcal{Y} 
			\end{aligned} \quad &(\phi^{P}_{pimy}) & \\
			%
			& q^{I}_{pibmy}  \leq av^{I}_{pibm}
			\left( \begin{aligned}
				\Lambda^{I}_{piby} \\ + \sum_{ y' \in \mathcal{Y} | (y-L^{I}_{i} \leq y' < y ) }  \Delta^{I}_{piby}
			\end{aligned} 
			\right)
			& \begin{aligned}
				\forall i \in \mathcal{I}, b \in \mathcal{IOB},\\  m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned}  \quad &( \Lambda^{I}_{piby}) & \\
			%
			& q^{P \rightarrow T}_{pcomy} \leq \left( 
			\begin{aligned}
				\Lambda^{P}_{pcoy} \\ + \sum_{ y' \in \mathcal{Y} | (y-L^{P}_{co} \leq y' < y ) } \Delta^{P}_{pcoy} 
			\end{aligned} 
			\right) \quad & \begin{aligned}
				\forall c \in \mathcal{C}, \forall o \in \mathcal{O},\\ m \in \mathcal{M}, y \in \mathcal{Y} 
			\end{aligned} \quad &(\lambda^{P}_{pcomy}) & \\
			%
			& \Delta^{P}_{pcoy} \leq \Omega^{P}_{pcoy} \quad &\begin{aligned}
				\forall c \in \mathcal{C}, \\ o \in \mathcal{O}, y \in \mathcal{Y}
			\end{aligned}  \quad &(\omega^{P}_{pcoy}) & \\
			%
			& \sum_{ y' \in \mathcal{Y} | (y-L^{I}_{i} \leq y' < y ) } \Delta^{I}_{piby'} \leq \Omega^{I}_{piby} \quad & \begin{aligned}
				\forall i \in \mathcal{I}, \\b \in \mathcal{IOB}, y \in \mathcal{Y}
			\end{aligned}  \quad &(\omega^{I}_{piby}) & \\
			%
			& q^{I}_{pibmy}, q^{P \rightarrow T}_{pcomy}, \Delta^{I}_{piby}, \Delta^{P}_{pcoy} \geq 0 \quad & & & 

		\end{aligned}
```