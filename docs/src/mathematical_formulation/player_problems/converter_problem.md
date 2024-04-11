# Converter

```math
\begin{aligned}	
\max_{\substack{q^{V}_{vtcdomy}, \\ \Delta^{V}_{vcc'y}, \\ \Delta^{RV}_{vrr'cc'y}}}  \quad &
			%
			\sum_{y \in \mathcal{Y}} r_{y} \left[ \begin{aligned}
				\sum_{(c,c') \in \mathcal{VT}} 
				\left(
				\begin{aligned}\sum_{t \in \mathcal{T}} \sum_{o \in \mathcal{O}} \sum_{m \in \mathcal{M}} d_m
					\left(
					\pi^{V \rightarrow T}_{tnc'omy} - fi^{V}_{cc'} \pi^{T \rightarrow V}_{tncomy} - c^{V}_{vcc'y} \right) q^{V}_{vtcc'omy} \\
					- \frac{1}{ \| \Delta \|_{y}} c^{\Delta V}_{vcc'y} \Delta^{V}_{vcc'y}
				\end{aligned}
				\right) \\
				- \frac{1}{ \| \Delta \|_{y}} \sum_{((r,r'),(cc')) \in \mathcal{RV}} c^{\Delta^{RV}}_{vrr'cc'y} \Delta^{RV}_{vrr'cc'y}
			\end{aligned} \right] \\
\text{s.t.} \quad 	
			& \begin{aligned} \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}} q^{V}_{vtcc'omy} \\ \leq \left( 
				\begin{aligned}
					\Lambda^{V}_{vcc'y}\\ 
					+ \sum_{y' \in \mathcal{Y} | y-L^{V}_{cc'} \leq y' < y } \Delta^{V}_{vcc'y} \\
					+ \sum_{(r,r') | ((r,r'),(cc')) \in \mathcal{RV}} \sum_{ y' \in \mathcal{Y} | y-L^{V}_{cc'} \leq y'< y}  f^{RV}_{rr'cc'} \Delta^{RV}_{vrr'cc'y}\\ 
					- \sum_{(r,r') | ((cc'),(r,r')) \in \mathcal{RV}} \sum_{ y' \in \mathcal{Y} | y'< y} \Delta^{RV}_{vcc'rr'y}
				\end{aligned} 
				\right)  \end{aligned} \, & 
			\begin{aligned}
				\forall m \in \mathcal{M}, y \in \mathcal{Y}, \\ (c,c') \in \mathcal{VT}
			\end{aligned}
			\quad & (\lambda^{V}_{vcc'my}) \\
			& q^{V}_{vtcc'omy}, \Delta^{V}_{vcc'y}, \Delta^{RV}_{vrr'cc'y} \geq 0 \quad & &
\end{aligned}
```