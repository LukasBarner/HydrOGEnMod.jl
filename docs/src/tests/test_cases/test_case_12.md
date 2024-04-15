# Test Case 12
Test Case 12 is structurally similar to [Test Case 11](@ref), but this time conversion capacities are non-existent instead of production capacities. The tables below depict the sets and parameters, respectively. The solution is the same as in [Test Case 11](@ref), only that conversion capacity should be expanded instead of production capacity (at the same cost). Passing criteria can be seen below, while the [figure](@ref test_case_12_graphical_solution) depicts the graphical solution.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU, CNG), (DEU\_to\_DEU, GH2)\}$$|
|$$\mathcal{C}$$ | $$\{CNG,GH2\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{OnlyTimeStep\}$$|
|$$\mathcal{N}$$ | $$\{DEU\}$$|
|$$\mathcal{O}$$ | $$\{FES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | ∅|
|$$\mathcal{T}$$ | $$\{T\_DEU\}$$|
|$$\mathcal{V}$$ | $$\{V\_DEU\}$$|
|$$\mathcal{VT}$$ | $$\{(CNG,GH2)\}$$|
|$$\mathcal{Y}$$ | $$\{2020,2025,2030\}$$

## Parameters
|Parameter|y=2020|y=2025|y=2030|
|:----- | ---: | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$0.2$$ | $$0.2$$ | $$0.2$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$$r_{y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.3$$ | $$0.3$$ | $$0.3$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$c^{P}_{P\_DEU,GH2,FES,y}$$ | $$1.3$$ | $$1.3$$ | $$1.3$$|
|$$c^{\Delta P}_{P\_DEU,GH2,FES,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$fi^{P}_{GH2,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{GH2,FES}$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,GH2,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,DEU,GH2,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$\Omega^{P}_{P\_DEU,GH2,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$fi^{V}_{CNG,GH2}$$ | $$1$$ | $$1$$ | $$1$$|
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$$l^{A}_{DEU\_to\_DEU,GH2}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{V}_{V\_DEU,CNG,GH2,y}$$ | $$0.3$$ | $$0.3$$ | $$0.3$$|
|$$c^{\Delta V}_{V\_DEU,CNG,GH2,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$\Lambda^{V}_{V\_DEU,CNG,GH2,y}$$| $$0$$ | $$0$$ | $$0$$|
|$$L^{V}_{CNG,GH2}$$ | $$5$$ | $$5$$  | $$5$$ |
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$ | $$50$$|
|$$c^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$L^{A}_{GH2}$$ | $$50$$ | $$50$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0.3$$ | $$0.3$$ | $$0.3$$ |
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$ | $$0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$1$$ | $$1$$ | $$1$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$ | $$0$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$|
|$$\alpha^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$2$$ | $$0.99$$ |
|$$\beta^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$ 

## Test Criteria
|Expression|Result y=2020|Result y=2025|Result y=2030|
|:----- | ---: | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$1$$ | $$0.99$$|
|$$\Delta^{V}_{V\_DEU,CNG,GH2,y}$$ | $$1$$ | $$0$$ | $$0$$ 
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|

## [Graphical Solution](@id test_case_12_graphical_solution)
### Marginalized Provision Costs and Prices
#### CNG 2020
![test_case_12a_graphic](../../images/test_case_12a_graphic.pdf)
#### GH2 2020
![test_case_12b_graphic](../../images/test_case_12b_graphic.pdf)
#### CNG 2025
![test_case_12c_graphic](../../images/test_case_12c_graphic.pdf)
#### GH2 2025
![test_case_12d_graphic](../../images/test_case_12d_graphic.pdf)
#### CNG 2030
![test_case_12e_graphic](../../images/test_case_12e_graphic.pdf)
#### GH2 2030
![test_case_12f_graphic](../../images/test_case_12f_graphic.pdf)