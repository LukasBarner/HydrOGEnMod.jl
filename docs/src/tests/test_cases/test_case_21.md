# Test Case 21
Test Case 21 asserts that repurposing of arc capacities works as intended, including repurposing factors. The tables below describe an extended version of [Test Case 9](@ref) with two commodities and years instead of one. In addition, an overview of test criteria and a graphical solution is displayed.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$\mathcal{A}$ | $\{DEU\_to\_DEU,DEU\_to\_NLD,NLD\_to\_DEU,NLD\_to\_NLD\}$|
|$\mathcal{AC}$ | $\begin{aligned} \{ (DEU\_to\_DEU, CNG), (DEU\_to\_NLD, CNG),  \\ (NLD\_to\_DEU, CNG), (NLD\_to\_NLD, CNG),  \\ (DEU\_to\_DEU, GH2), (DEU\_to\_NLD, GH2),  \\ (NLD\_to\_DEU, GH2), (NLD\_to\_NLD, GH2)\}\end{aligned}$|
|$\mathcal{C}$ | $\{CNG,GH2\}$|
|$\mathcal{DSB}$ | $\{Block 1\}$|
|$\mathcal{I}$ | $\{Natural Gas\}$|
|$\mathcal{IOB}$ | $\{Block 1\}$|
|$\mathcal{M}$ | $\{OnlyTimeStep\}$|
|$\mathcal{N}$ | $\{DEU,NLD\}$|
|$\mathcal{O}$ | $\{FES\}$|
|$\mathcal{P}$ | $\{P\_DEU,P\_NLD\}$|
|$\mathcal{RA}$ | ∅|
|$\mathcal{RS}$ | ∅|
|$\mathcal{RV}$ | ∅|
|$\mathcal{S}$ | ∅|
|$\mathcal{T}$ | $\{T\_DEU,T\_NLD\}$|
|$\mathcal{V}$ | ∅|
|$\mathcal{VT}$ | ∅|
|$\mathcal{Y}$ | $\{2020,2021\}$|

## Parameters
|Parameter|y=2020|y=2021|
|:----- | ---: | ---: |
|$\frac{1}{ \| \Delta \|_{y}}$ | $1$|$1$|
|${1}^{NC}_{T\_DEU,DEU,CNG}$ | $0$ | $0$|
|${1}^{NC}_{T\_DEU,NLD,CNG}$ | $0$ | $0$|
|${1}^{NC}_{T\_NLD,DEU,CNG}$ | $0$ | $0$|
|${1}^{NC}_{T\_NLD,NLD,CNG}$ | $0$ | $0$|
|${1}^{NC}_{T\_DEU,DEU,GH2}$ | $0$ | $0$|
|${1}^{NC}_{T\_DEU,NLD,GH2}$ | $0$ | $0$|
|${1}^{NC}_{T\_NLD,DEU,GH2}$ | $0$ | $0$|
|${1}^{NC}_{T\_NLD,NLD,GH2}$ | $0$ | $0$|
|$r_{y}$ | $1$| $1$|
|$d_{OnlyTimeStep}$ | $1$| $1$|
|$c^{P}_{P\_DEU,CNG,FES,y}$ | $0.5$ | $0.5$|
|$c^{\Delta P}_{P\_DEU,CNG,FES,y}$ | $1$ | $1$|
|$c^{P}_{P\_NLD,CNG,FES,y}$ | $0.5$ | $0.5$|
|$c^{\Delta P}_{P\_NLD,CNG,FES,y}$ | $1$ | $1$|
|$fi^{P}_{CNG,Natural Gas,FES}$ | $1$ | $1$|
|$L^{P}_{CNG,FES}$ | $50$ | $50$|
|$\Lambda^{P}_{P\_DEU,CNG,FES,y}$ | $10$ | $10$|
|$c^{P}_{P\_DEU,GH2,FES,y}$ | $0.4$ | $0.4$|
|$c^{\Delta P}_{P\_DEU,GH2,FES,y}$ | $1$ | $1$|
|$c^{P}_{P\_NLD,GH2,FES,y}$ | $0.5$ | $0.5$|
|$c^{\Delta P}_{P\_NLD,GH2,FES,y}$ | $1$ | $1$|
|$fi^{P}_{GH2,Natural Gas,FES}$ | $1$ | $1$|
|$L^{P}_{GH2,FES}$ | $50$ | $50$|
|$\Lambda^{P}_{P\_DEU,GH2,FES,y}$ | $10$ | $10$|
|$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$ | $10$ | $10$|
|$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$ | $0$ | $0$|
|$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$ | $0$ | $0$|
|$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$ | $10$ | $10$|
|$\Lambda^{T}_{T\_DEU,NLD,CNG,FES,y}$ | $10$ | $10$|
|$\Lambda^{T}_{T\_DEU,DEU,GH2,FES,y}$ | $10$ | $10$|
|$\Lambda^{T}_{T\_DEU,NLD,GH2,FES,y}$ | $10$ | $10$|
|$\Omega^{P}_{P\_DEU,CNG,FES,y}$ | $10$  | $10$ |
|$\Omega^{P}_{P\_DEU,GH2,FES,y}$ | $10$  | $10$ |
|$\Lambda^{P}_{P\_NLD,CNG,FES,y}$ | $10$ | $10$|
|$\Lambda^{P}_{P\_NLD,GH2,FES,y}$ | $10$ | $10$|
|$\Lambda^{I}_{P\_NLD,Natural Gas,Block 1,y}$ | $10$ | $10$|
|$\Omega^{I}_{P\_NLD,Natural Gas,Block 1,y}$ | $0$ | $0$|
|$c^{\Delta^{I}}_{P\_NLD,Natural Gas,Block 1,y}$ | $0$ | $0$|
|$\Lambda^{T}_{T\_NLD,DEU,CNG,FES,y}$ | $10$ | $10$|
|$\Lambda^{T}_{T\_NLD,DEU,GH2,FES,y}$ | $10$ | $10$|
|$\Lambda^{T}_{T\_NLD,NLD,CNG,FES,y}$ | $10$ | $10$|
|$\Lambda^{T}_{T\_NLD,NLD,GH2,FES,y}$ | $10$ | $10$|
|$\Omega^{P}_{P\_NLD,CNG,FES,y}$ | $10$  | $10$ |
|$\Omega^{P}_{P\_NLD,GH2,FES,y}$ | $10$  | $10$ |
|$l^{A}_{DEU\_to\_DEU,CNG}$| $0.0$| $0.0$|
|$l^{A}_{DEU\_to\_NLD,CNG}$| $0.0$| $0.0$|
|$l^{A}_{NLD\_to\_DEU,CNG}$| $0.1$| $0.1$|
|$l^{A}_{NLD\_to\_NLD,CNG}$| $0.0$| $0.0$|
|$l^{A}_{DEU\_to\_DEU,GH2}$| $0.0$| $0.0$|
|$l^{A}_{DEU\_to\_NLD,GH2}$| $0.0$| $0.0$|
|$l^{A}_{NLD\_to\_DEU,GH2}$| $0.1$| $0.1$|
|$l^{A}_{NLD\_to\_NLD,GH2}$| $0.0$| $0.0$|
|$c^{A}_{DEU\_to\_DEU,CNG,y}$ | $0.0$ | $0.0$|
|$c^{A}_{DEU\_to\_NLD,CNG,y}$ | $0.0$| $0.0$|
|$c^{A}_{NLD\_to\_DEU,CNG,y}$ | $0.1$ | $0.1$|
|$c^{A}_{NLD\_to\_NLD,CNG,y}$ | $0.0$ | $0.0$|
|$c^{A}_{DEU\_to\_DEU,GH2,y}$ | $0.0$| $0.0$|
|$c^{A}_{DEU\_to\_NLD,GH2,y}$ | $0.0$| $0.0$|
|$c^{A}_{NLD\_to\_DEU,GH2,y}$ | $0.1$ | $0.1$|
|$c^{A}_{NLD\_to\_NLD,GH2,y}$ | $0.0$ | $0.0$|
|$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$ | $0$ | $0$|
|$c^{\Delta A}_{DEU\_to\_NLD,CNG,y}$ | $10$ | $10$|
|$c^{\Delta A}_{NLD\_to\_DEU,CNG,y}$ | $10$ | $10$|
|$c^{\Delta A}_{NLD\_to\_NLD,CNG,y}$ | $0$ | $0$|
|$c^{\Delta A}_{DEU\_to\_DEU,GH2,y}$ | $0$ | $0$|
|$c^{\Delta A}_{DEU\_to\_NLD,GH2,y}$ | $10$ | $10$|
|$c^{\Delta A}_{NLD\_to\_DEU,GH2,y}$ | $10$| $10$|
|$c^{\Delta A}_{NLD\_to\_NLD,GH2,y}$ | $0$ | $0$|
|$c^{\Delta^{RA}}_{DEU\_to\_DEU,CNG,GH2,y}$ | $0$ | $0$|
|$c^{\Delta^{RA}}_{DEU\_to\_NLD,CNG,GH2,y}$ | $0$ | $0$|
|$c^{\Delta^{RA}}_{NLD\_to\_DEU,CNG,GH2,y}$ | $0.055$ | $0.055$|
|$c^{\Delta^{RA}}_{NLD\_to\_NLD,CNG,GH2,y}$ | $0$ | $0$|
|$f^{RA}_{CNG,GH2}$ | $0.5$ | $0.5$|
|$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$ | $0$ | $0$|
|$\Lambda^{A}_{DEU\_to\_NLD,CNG,y}$ | $10$ | $10$|
|$\Lambda^{A}_{NLD\_to\_DEU,CNG,y}$ | $10$ | $10$|
|$\Lambda^{A}_{NLD\_to\_NLD,CNG,y}$ | $0$ | $0$|
|$\Lambda^{A}_{DEU\_to\_DEU,GH2,y}$ | $0$ | $0$|
|$\Lambda^{A}_{DEU\_to\_NLD,GH2,y}$ | $0$ | $0$|
|$\Lambda^{A}_{NLD\_to\_DEU,GH2,y}$ | $0$ | $0$|
|$\Lambda^{A}_{NLD\_to\_NLD,GH2,y}$ | $0$ | $0$|
|$L^{A}_{CNG}$ | $50$ | $50$|
|$L^{A}_{GH2}$ | $50$ | $50$|
|$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$| $2$| $2$|
|$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$| $0$| $0$|
|$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$| $1$| $1$|
|$c^{I_{l}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$| $0.5$| $0.5$|
|$c^{I_{q}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$| $0$| $0$|
|$av^{I}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep}$| $1$| $1$|
|$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$| $2$| $0$|
|$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$| $-1$| $0$|
|$\alpha^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$| $0$| $0$|
|$\beta^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$| $-1$| $0$|
|$\alpha^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$| $0$| $2$|
|$\beta^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$| $0$| $-1$|
|$\alpha^{D}_{NLD,GH2,Block 1,OnlyTimeStep,y}$| $0$| $0$|
|$\beta^{D}_{NLD,GH2,Block 1,OnlyTimeStep,y}$| $0$| $-1$|

## [Test Criteria](@id test_case_19_test_criteria)

|Expression|Result y=2020|Result y=2021|
|:----- | ---: | ---: |
|$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$ | $1.2$ | $0$ |
|$\tilde{P}^{T \rightarrow D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$ | $0.0$ | $0.0$ |
|$\tilde{P}^{T \rightarrow D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$ | $0$ | $1.2$ |
|$\tilde{P}^{T \rightarrow D}_{NLD,GH2,Block 1,OnlyTimeStep,y}$ | $0.0$ | $0.0$ |
|$q^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$ | $0.0$ | $0.0$ |
|$q^{I}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$ | $0.88$  | $0.88$ |

## [Graphical Solution](@id test_case_21_graphical_solution)
### Marginalized Provision Costs and Prices for Different Nodes
#### Node NLD in 2020 for CNG
![test_case_21a_graphic](../../images/test_case_21a_graphic.pdf)
#### Node DEU in 2020 for CNG
![test_case_21b_graphic](../../images/test_case_21b_graphic.pdf)
#### Node NLD in 2021 for CNG
![test_case_21c_graphic](../../images/test_case_21c_graphic.pdf)
#### Node DEU in 2021 for CNG
![test_case_21d_graphic](../../images/test_case_21d_graphic.pdf)
#### Node NLD in 2020 for GH2
![test_case_21e_graphic](../../images/test_case_21e_graphic.pdf)
#### Node DEU in 2020 for GH2
![test_case_21f_graphic](../../images/test_case_21f_graphic.pdf)
#### Node NLD in 2021 for GH2
![test_case_21g_graphic](../../images/test_case_21g_graphic.pdf)
#### Node DEU in 2021 for GH2
![test_case_21h_graphic](../../images/test_case_21h_graphic.pdf)