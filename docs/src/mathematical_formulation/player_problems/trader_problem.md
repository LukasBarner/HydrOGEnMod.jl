# Trader

```math
\begin{aligned}	
\max_{\substack{q^{T \rightarrow D}_{tncbomy}, \\ q^{T \leftarrow P}_{tncomy}, \\ q^{T \rightarrow V}_{tncomy}, \\ q^{T \leftarrow V}_{tncomy}, \\ q^{T \rightarrow S}_{tncomy}, \\ q^{T \leftarrow S}_{tncomy}, \\ q^{T}_{tacomy}}}  \quad & \sum_{y \in \mathcal{Y}} r_{y} \sum_{m \in \mathcal{M}} d_m \sum_{o \in \mathcal{O}} \sum_{c \in \mathcal{C}} \left[ 
			\begin{aligned}
				\sum_{n \in \mathcal{N}} \left( 
				\begin{aligned}
					{1}^{NC}_{tnc} \cdot \sum_{b \in \mathcal{DSB}} \tilde{P}^{T \rightarrow D}_{ncbmy}\biggl(Q^{T \rightarrow D}_{ncbmy}\biggr) \cdot q^{T \rightarrow D}_{tncbomy}  \\ 
					+  \left( 1 - {1}^{NC}_{tnc} \right) \cdot \sum_{b \in \mathcal{DSB}}  \pi^{T \rightarrow D}_{ncbmy} \cdot q^{T \rightarrow D}_{tncbomy} 
				\end{aligned}
				\right) \\
				+  \sum_{n \in \mathcal{N}} \left( \pi^{T \rightarrow V}_{tncomy} \right) q^{T \rightarrow V}_{tncomy} \\
				-  \sum_{n \in \mathcal{N}}\left( \pi^{V \rightarrow T}_{tncomy} \right) q^{T \leftarrow V}_{tncomy} \\
				+  \sum_{n \in \mathcal{N}}\left( \pi^{T \rightarrow S}_{tncomy} \right) q^{T \rightarrow S}_{tncomy} \\
				-  \sum_{n \in \mathcal{N}}\left( \pi^{S \rightarrow T}_{tncomy} \right) q^{T \leftarrow S}_{tncomy} \\
				-  \sum_{a \in \mathcal{A} | (a,c) \in \mathcal{AC} }\left( \pi^{A}_{acmy} \right) q^{T}_{tacomy} \\
				-  \sum_{n \in \mathcal{N}_p(t)}\left( \pi^{P}_{ncomy} \right) q^{T \leftarrow P}_{tncomy}\\
			\end{aligned} 
			\right] \\
\text{s.t.} &\begin{aligned}
				\left(\begin{aligned}
					\sum_{a \in \mathcal{A}_s(n)  | (a,c) \in \mathcal{AC} } (1+l^{A}_{ac}) q^{T}_{tacomy} \\ 
					+ \sum_{b \in \mathcal{DSB}} q^{T \rightarrow D}_{tncbomy}\\
					+ q^{T \rightarrow V}_{tncomy} \\
					+ q^{T \rightarrow S}_{tncomy}
				\end{aligned}\right) \\  \leq 
				\left(\begin{aligned}
					\sum_{a \in \mathcal{A}_e(n) | (a,c) \in \mathcal{AC} } q^{T}_{tacomy} \\ 
					+ \sum_{n \in \mathcal{N}_p(t)} q^{T \leftarrow P}_{tncomy} \\
					+ q^{T \leftarrow V}_{tncomy} \\
					+ q^{T \leftarrow S}_{tncomy}
				\end{aligned}\right) 
			\end{aligned} 
			& \begin{aligned}
				\forall n \in \mathcal{N}, c \in \mathcal{C}, \\ o \in \mathcal{O}, m \in \mathcal{M}, \\ y \in \mathcal{Y} 
			\end{aligned} \quad &(\phi^{T}_{tncomy}) \\
			%
			& \sum_{m \in \mathcal{M}} d_{m} \sum_{b \in \mathcal{DSB}} q^{T \rightarrow D}_{tncbomy} \leq \Lambda^{T}_{tncoy} \quad & 
			\begin{aligned}
				\forall n \in \mathcal{N}, c \in \mathcal{C}, \\ o \in \mathcal{O}, y \in \mathcal{Y}
			\end{aligned}
			\quad & (\lambda^{T}_{tncoy}) \\
			& \begin{aligned}
				q^{T \rightarrow D}_{tncbomy}, q^{T \leftarrow P}_{tncomy}, q^{T \rightarrow V}_{tncomy}, \\ q^{T \leftarrow V}_{tncomy}, q^{T \rightarrow S}_{tncomy}, q^{T \leftarrow S}_{tncomy}, q^{T}_{tacomy}
			\end{aligned} \geq 0 \quad & & \\
\end{aligned}
```