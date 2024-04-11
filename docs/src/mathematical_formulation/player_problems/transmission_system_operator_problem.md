# Transmission System Operator

```math
\begin{aligned}	
\max_{\substack{q^{A}_{acmy}, \\ \Delta^{A}_{acy}, \\ \Delta^{RA}_{arcy}}}  \quad &
			\sum_{y \in \mathcal{Y}} r_{y} \sum_{a \in \mathcal{A}} \left[ \begin{aligned}
				\sum_{c \in \mathcal{C} | (a,c) \in \mathcal{AC} }  \left(
				\begin{aligned}\sum_{m \in \mathcal{M}} d_{m}
					\left( \pi^{A}_{acmy} - c^{A}_{acy} \right) q^{A}_{acmy}
					- \frac{1}{ \| \Delta \|_{y}} \frac{1}{2} c^{\Delta A}_{acy} \Delta^{A}_{acy} 
				\end{aligned} \right) \\
				- \frac{1}{ \| \Delta \|_{y}} \sum_{(r,c) \in \mathcal{RA} | (a,r) \in \mathcal{AC} } \frac{1}{2} c^{\Delta^{RA}}_{arcy} \Delta^{RA}_{arcy}
			\end{aligned} \right] \\
\text{s.t.} \quad 	
			%
			& q^{A}_{acmy} \leq \left( 
			\begin{aligned}
				\Lambda^{A}_{acy} \\ 
				+ \sum_{ y' \in \mathcal{Y} | y-L^{A}_{c} \leq y'< y} \Delta^{A}_{acy}\\ 
				+ \sum_{r | (r,c) \in \mathcal{RA}} \sum_{ y' \in \mathcal{Y} | y-L^{A}_{c} \leq y'< y} f^{RA}_{rc} \Delta^{RA}_{arcy}\\ 
				- \sum_{r | (c,r) \in \mathcal{RA}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RA}_{acry}
			\end{aligned} 
			\right)  \quad & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} , \\ m \in \mathcal{M}, y \in \mathcal{Y}
			\end{aligned}
			\quad & (\lambda^{A}_{acmy}) \\
			%
			& \Delta^{A}_{acy} =  \Delta^{A}_{a^{-1}(a)cy}  \quad & 
			\begin{aligned}
				\forall  (a,c) \in \mathcal{AC} , \\  y \in \mathcal{Y}
			\end{aligned}
			\quad & (\delta^{A}_{acy}) \\
			%
			& \Delta^{RA}_{arcy} = \Delta^{RA}_{a^{-1}(a)rcy} \quad & 
			\begin{aligned}
				\forall a \in \mathcal{A}, (r,c) \in \mathcal{RA}, \\  (a,r) \in \mathcal{AC}, \\y \in \mathcal{Y}
			\end{aligned}
			\quad & (\delta^{RA}_{arcy}) \\
			& q^{A}_{acmy}, \Delta^{A}_{acy}, \Delta^{RA}_{arcy}  \geq 0 \quad & &
\end{aligned}
```