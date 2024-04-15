# Test Case 11
Test Case 11 tests production capacity expansion, including scaling of investment costs and lifetimes. The tables below depict the sets and parameters, respectively. Input, production and conversion costs during all periods amount to $$0.6$$ for CNG and $$0.9$$ for GH2. However, there exists no demand for CNG and no production capacity is available in any period. Capacity expansion comes at a unit cost of $$0.5$$, which is rescaled to $$0.1$$ per modeled year. Lifetimes of investments are assumed to be 5 years. In combination with the model time steps of five years, investment costs behave like marginalized costs and can be added on top. Prices in 2025 will be $$P=0.9+0.1$$, since demand is able to justify an investment. However, invested capacities from 2020 should not carry over to 2030, and the inverse demand intercept of 0.99 does not justify additional investments. Hence, prices for GH2 should be $$P=0$$, $$P=1$$, $$P=0.99$$, in 2020, 2025 and 2030 respectively, while there exists no demand for CNG. In addition, production capacity of 1 should be invested in 2020 for CNG, while no investments should be made in 2025 and 2030 as well as for GH2. Tests pass if all these criteria are met, as can be seen from the table below. The [figure](@ref test_case_11_graphical_solution) below depicts a graphical solution.

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
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$\Omega^{P}_{P\_DEU,GH2,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
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
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$ | $$0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$1$$ | $$1$$ | $$1$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$ | $$0$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$|
|$$\alpha^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$2$$ | $$0.99$$ |
|$$\beta^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$ |

## Test Criteria
|Expression|Result y=2020|Result y=2025|Result y=2030|
|:----- | ---: | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\tilde{P}^{T \rightarrow D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$1$$ | $$0.99$$|
|$$\Delta^{P}_{P\_DEU,CNG,FES,y}$$ | $$1$$ | $$0$$ | $$0$$ |
|$$\Delta^{P}_{P\_DEU,CNG,FES,y}$$ | $$0$$ | $$0$$ | $$0$$ |

## [Graphical Solution](@id test_case_11_graphical_solution)
### Marginalized Provision Costs and Prices for Different Time Steps and Commodities
#### CNG 2020
![test_case_11a_graphic](../../images/test_case_11a_graphic.pdf)
#### GH2 2020
![test_case_11b_graphic](../../images/test_case_11b_graphic.pdf)
#### CNG 2025
![test_case_11c_graphic](../../images/test_case_11c_graphic.pdf)
#### GH2 2025
![test_case_11d_graphic](../../images/test_case_11d_graphic.pdf)
#### CNG 2030
![test_case_11e_graphic](../../images/test_case_11e_graphic.pdf)
#### GH2 2030
![test_case_11f_graphic](../../images/test_case_11f_graphic.pdf)