# Test Case 4
Test Case 4 asserts that discounting works as intended. It depicts a perfectly competitive version of [Test Case 3](@ref) over the course of two years, where the second period is discounted by 50\%. Prices should be $$P=1.0$$ in both years. Social welfare corresponds to the gray triangle in the [graphical solution](@ref test_case_4_graphical_solution), where the second period must be discounted accordingly. Hence, the total objective value (corresponding to social welfare in the absence of strategic behavior) must be $$0.75$$. Both, prices and objective values, are tested against.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU,CNG)\}$$|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
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
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | $$\{2020,2021\}$$

## Parameters
|Parameter|y=2020|y=2021|
|:----- | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$|
|$$r_{y}$$ | $$1$$ | $$0.5$$|
|$$d_{OnlyTimeStep}$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.5$$ | $$0.5$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.5$$ | $$0.5$$ |
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$ | $$1$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$-1$$ | $$-1$$|

## Test Criteria
|Expression|Result y=2020|y=2021|
|:----- | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,2020}$$ | $$1.0$$| $$1.0$$|
|Objective Value | | 0.75|

## [Graphical Solution](@id test_case_4_graphical_solution)
### Social Welfare in Test Years 
#### 2020
![test_case_4a_graphic](../../images/test_case_4a_graphic.pdf)
#### 2021
![test_case_4b_graphic](../../images/test_case_4b_graphic.pdf)