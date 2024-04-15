# Test Case 23
Test Case 23 asserts that piece-wise quadratic cost functions for input procurement work as desired. It is structurally similar to [Test Case 3](@ref), only that the first block of input procurement only goes to 25% of the total capacity of 1. After a quantity of 0.2, an increase in marginalized cost slope can be identified. Below, a graphical representation of the optimal solution is provided. Hence, this test passes if the equilibrium price is $$P=1.5$$, with an objective value of 0.45 and corresponding social welfare of 0.575 (see the grey area in the graphic).

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU, CNG)\}$$|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1,Block 2\}$$|
|$$\mathcal{M}$$ | $$\{OnlyTimeStep\}$$|
|$$\mathcal{N}$$ | $$\{DEU\}$$|
|$$\mathcal{O}$$ | $$\{FES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | ∅|
|$$\mathcal{T}$$ | $$\{T\_DEU\}$$|
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | $$\{2020\}$$|

## Parameters
|Parameter|y=2020|
|:----- | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$1$$|
|$$r_{y}$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.3$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0.25$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 2,y}$$ | $$0.75$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 2,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 2,y}$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$| $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$| $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.1$$ |
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.4$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$ |
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 2,OnlyTimeStep,y}$$ | $$0.2$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 2,OnlyTimeStep,y}$$ | $$2.0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 2,OnlyTimeStep}$$ | $$1$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$|

## Test Criteria
|Expression|Result y=2020|
|:----- | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$1.5$$ |
|Objective Value | $$0.45$$|
|Social Welfare | $$0.575$$|
## Graphical Solution
### Profit Maximization in a Cournot Setting
![test_case_23_graphic](../../images/test_case_23_graphic.pdf)