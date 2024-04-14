# Test Case 8
Test Case 8 asserts, that demand for multiple commodities can be satisfied by one input. The tables below depict the sets and parameters, respectively. For both natural gas and hydrogen, prices should be equal to marginalized cost of provision. $$MC_{Hydrogen} = 2\cdot0.9 +0.2$$ and $$MC_{Natural Gas} = 1\cdot(0.9) +0.1$$. Hence, $$P_{Hydrogen} = 2$$ and $$P_{Natural Gas} = 1$$, with a total production quantity of 5 (4 of which are used in conversion to hydrogen and 1 of which goes to demand directly). Passing criteria can be seen below, while the [figure](@ref test_case_8_graphical_solution) below depicts a graphical solution.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU,CNG), (DEU\_to\_DEU,GH2)\}$$|
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
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.5$$|
|$$c^{P}_{P\_DEU,GH2,FES,y}$$ | $$1$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$c^{\Delta P}_{P\_DEU,GH2,FES,y}$$ | $$10$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$|
|$$fi^{P}_{GH2,Natural Gas,FES}$$ | $$2$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$|
|$$L^{P}_{GH2,FES}$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{P}_{P\_DEU,GH2,FES,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$| $$10$$ |
|$$\Omega^{P}_{P\_DEU,GH2,FES,y}$$| $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$| $$0$$|
|$$l^{A}_{DEU\_to\_DEU,GH2}$$| $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$|
|$$c^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$|
|$$L^{A}_{GH2}$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0.5$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$0$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$|
|$$\alpha^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$4$$|
|$$\beta^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$-1$$ |

## Test Criteria
|Expression|Result y=2020|
|:----- | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$1$$ |
|$$\tilde{P}^{T \rightarrow D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$ | $$2$$ |
|$$q^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$5$$ |

## [Graphical Solution](@id test_case_8_graphical_solution)
