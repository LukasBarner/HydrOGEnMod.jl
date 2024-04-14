# Test Case 13
Test Case 13 is similar to [Test Case 9](@ref), only that this time transport capacity is limited. The tables below depict the sets and parameters, respectively. Production costs in DEU are much too high. However, NLD has no own demand and can export to DEU with operational cost of $$0.05$$ if capacity is invested. In addition to production and conversion costs of in total $$0.9$$, rescaled investment costs of 0.05 must be added. Marginalized provision costs are hence $$1.0$$. Tests are passed, if DEU prices are $$P=0$$, $$P=1$$, $$P=0.99$$, in 2020, 2025 and 2030 respectively. In addition, capacity of 1 on arc NLD\_to\_DEU and reverse should be invested in 2020, while no investments should be made in 2025 and 2030. No other arc capacities should be expanded, and prices in NLD must be $$0$$. Passing criteria can be seen below, while the [figure](@ref test_case_13_graphical_solution) depicts a graphical solution.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU,DEU\_to\_NLD,NLD\_to\_DEU,NLD\_to\_NLD\}$$|
|$$\mathcal{AC}$$ | $$\begin{aligned} \{(DEU\_to\_DEU, CNG),(DEU\_to\_NLD, CNG),  \\ (NLD\_to\_DEU,CNG),(NLD\_to\_NLD, CNG)\}\end{aligned}$$|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{OnlyTimeStep\}$$|
|$$\mathcal{N}$$ | $$\{DEU,NLD\}$$|
|$$\mathcal{O}$$ | $$\{FES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU,P\_NLD\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | ∅|
|$$\mathcal{T}$$ | $$\{T\_DEU,T\_NLD\}$$|
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | $$\{2020,2025,2030\}$$|

## Parameters
|Parameter|y=2020|y=2025|y=2030|
|:----- | ---: | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_DEU,NLD,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_NLD,DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_NLD,NLD,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$$r_{y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.4$$ | $$0.4$$ | $$0.4$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_NLD,CNG,FES,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$c^{\Delta P}_{P\_NLD,CNG,FES,y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,NLD,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$\Lambda^{P}_{P\_NLD,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_NLD,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_NLD,NLD,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_NLD,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$l^{A}_{DEU\_to\_NLD,CNG}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$l^{A}_{NLD\_to\_DEU,CNG}$$ | $$0.1$$ | $$0.1$$ | $$0.1$$|
|$$l^{A}_{NLD\_to\_NLD,CNG}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$0.05$$ | $$0.05$$ | $$0.05$$|
|$$c^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta A}_{DEU\_to\_NLD,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta A}_{NLD\_to\_DEU,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta A}_{NLD\_to\_NLD,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$ | $$2$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{I_{l}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$c^{I_{q}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$-1$$ | $$-1$$ | $$-1$$|
|$$\alpha^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\beta^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$-1$$ | $$-1$$ | $$-1$$|

## Test Criteria
|Expression|Result y=2020|Result y=2025|Result y=2030|
|:----- | ---: | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$1$$ | $$0.99$$ |
|$$\tilde{P}^{T \rightarrow D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$0.0$$| $$0.0$$| $$0.0$$ |
|$$\Delta^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0.0$$  | $$0.0$$  | $$0.0$$ |
|$$\Delta^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$1.0$$  | $$0.0$$  | $$0.0$$ |
|$$\Delta^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$1.0$$  | $$0.0$$  | $$0.0$$ |
|$$\Delta^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0.0$$  | $$0.0$$  | $$0.0$$|

## [Graphical Solution](@id test_case_13_graphical_solution)
