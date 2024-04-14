# Test Case 15
Test Case 15 is similar to [Test Case 11](@ref), except that production capacity expansion is disallowed. The tables below depict the sets and parameters, respectively. Since no production is possible now, prices must be equal to inverse demand intercepts. The test is passed, if prices in 2020, 2025 and 2030 are 0, 2 and 0.99, respectively and no capacities are invested in. Passing criteria can be seen in below, while the [figure](@ref test_case_15_graphical_solution) depicts a graphical solution.

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
|$$\mathcal{Y}$$ | $$\{2020,2025,2030\}$$|

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
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{P}_{P\_DEU,GH2,FES,y}$$ | $$1.3$$ | $$1.3$$ | $$1.3$$|
|$$c^{\Delta P}_{P\_DEU,GH2,FES,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$fi^{P}_{GH2,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{GH2,FES}$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,GH2,FES,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,DEU,GH2,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$0$$  | $$0$$  | $$0$$ |
|$$\Omega^{P}_{P\_DEU,GH2,FES,y}$$ | $$0$$  | $$0$$  | $$0$$ |
|$$fi^{V}_{CNG,GH2}$$ | $$1$$ | $$1$$ | $$1$$|
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$$l^{A}_{DEU\_to\_DEU,GH2}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{V}_{V\_DEU,CNG,GH2,y}$$ | $$0.3$$ | $$0.3$$ | $$0.3$$|
|$$c^{\Delta V}_{V\_DEU,CNG,GH2,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{V}_{V\_DEU,CNG,GH2,y}$$| $$10$$ | $$10$$ | $$10$$|
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
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$ | $$0$$ |e
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$1$$ | $$1$$ | $$1$$ |midrule
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$ | $$0$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$|
|$$\alpha^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$2$$ | $$0.99$$ |
|$$\beta^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$ |

## Test Criteria
|Expression|Result y=2020|Result y=2025|Result y=2030|
|:----- | ---: | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\tilde{P}^{T \rightarrow D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$2$$ | $$0.99$$|
|$$\Delta^{P}_{P\_DEU,CNG,FES,y}$$ | $$0$$ | $$0$$ | $$0$$ |
|$$\Delta^{P}_{P\_DEU,CNG,FES,y}$$ | $$0$$ | $$0$$ | $$0$$ |

## [Graphical Solution](@id test_case_15_graphical_solution)
