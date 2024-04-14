# Test Case 19
Test Case 19 is structurally similar to [Test Case 7](@ref) and asserts, that trade restrictions by origin work as intended. As can be seen from the tables below, trade of cheaper CNG from renewable electricity is restricted. The test is passed, if prices remain the same, but only fossil natural gas is produced. This is because fossil CNG had been price setting at $$0.5$$ in [Test Case 7](@ref) already. Passing criteria can be seen below, while the [figure](@ref test_case_19_graphical_solution) depicts a graphical solution.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU, CNG)\}$$|
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
|$$\mathds{1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$|
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
|$$q^{I}_{P\_DEU,Natural Gas,OnlyTimeStep,y}$$ | $$1$$ |
|$$q^{I}_{P\_DEU,Renewable Electricity,OnlyTimeStep,y}$$ | $$1$$  |

## [Graphical Solution](@id test_case_19_graphical_solution)
