# Test Case 7
Test Case 7 assures that demand for a commodity can be met from different origins. Cost optimal allocation in this case requires that cheapest marginalized provision cost from each origin must be utilized. Marginalized provision cost and the resulting price for the data given in the tables below are visualialized in the [graphical solution](@ref test_case_7_graphical_solution). Note that the sum of production quantities from each origin must equal total demand quantity. 
Tests are passed if $$P=0.5$$ and produced quantities are 1 from each natural gas and renewable electricity. Note that conversion from renewable electricity to CNG happens at 2:1. Marginalized demand provision costs of renewables are hence $$MC_{RES} = 2 \cdot (0.1 + 0.025 Q) + 0.25$$, while $$MC_{FES} = 0.5$$. 

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU,CNG)\}$$|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas,Renewable Electricity\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{OnlyTimeStep\}$$|
|$$\mathcal{N}$$ | $$\{DEU\}$$|
|$$\mathcal{O}$$ | $$\{FES,RES\}$$|
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
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$|
|$$r_{y}$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.25$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$|
|$$fi^{P}_{CNG,Renewable Electricity,FES}$$ | $$0$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$c^{P}_{P\_DEU,CNG,RES,y}$$ | $$0.25$$|
|$$c^{\Delta P}_{P\_DEU,CNG,RES,y}$$ | $$10$$|
|$$fi^{P}_{CNG,Renewable Electricity,RES}$$ | $$2$$|
|$$fi^{P}_{CNG,Natural Gas,RES}$$ | $$0$$|
|$$L^{P}_{CNG,RES}$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,RES,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Renewable Electricity,Block 1,y}$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$\Omega^{I}_{P\_DEU,Renewable Electricity,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Renewable Electricity,Block 1,y}$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$| $$10$$ |
|$$\Omega^{P}_{P\_DEU,CNG,RES,y}$$| $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$| $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0.25$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$1$$|
|$$c^{I_{l}}_{P\_DEU,Renewable Electricity,Block 1,OnlyTimeStep,y}$$| $$0.1$$|
|$$c^{I_{q}}_{P\_DEU,Renewable Electricity,Block 1,OnlyTimeStep,y}$$| $$0.025$$|
|$$av^{I}_{P\_DEU,Renewable Electricity,Block 1,OnlyTimeStep}$$| $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$|

## Test Criteria
|Expression|Result y=2020|
|:----- | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$0.5$$ |
|$$q^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$1$$ |
|$$q^{I}_{P\_DEU,Renewable Electricity,Block 1,OnlyTimeStep,y}$$ | $$1$$ |

## [Graphical Solution](@id test_case_7_graphical_solution)
### Marginalized Provision Costs and Price
![test_case_7_graphic](../../images/test_case_7_graphic.pdf)
