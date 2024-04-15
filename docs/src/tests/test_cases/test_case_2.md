# Test Case 2
Test Case 2 adds multiple years and tests for prices in both, while also including conversion costs. As before, relevant sets and parameters can be seen from the tables below. Marginalized costs for given factor intensities are $$MC=c^{Pl} + c^{P} + c^{V} + \beta^{P} \cdot Q$$, while prices are $$P(Q) = \alpha^{D} + \beta^{D} Q$$. Hence, as stated and illustrated below, tests pass if prices in both years are $$P=1.25$$ for CNG and $$P=0.0$$ for GH2. 

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU,CNG),(DEU\_to\_DEU,GH2)\}$$|
|$$\mathcal{C}$$ | $$\{CNG,GH2\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Electricity\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{OnlyTimeStep\}$$|
|$$\mathcal{N}$$ | $$\{DEU\}$$|
|$$\mathcal{O}$$ | $$\{RES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | ∅|
|$$\mathcal{T}$$ | $$\{T\_DEU\}$$|
|$$\mathcal{V}$$ | $$\{V\_DEU\}$$|
|$$\mathcal{VT}$$ | $$\{(GH2,CNG)\}$$|
|$$\mathcal{Y}$$ | $$\{2020,2021\}$$|

## Parameters
|Parameter|y=2020|y=2021|
|:----- | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_DEU,DEU,GH2}$$ | $$0$$ | $$0$$|
|$$r_{y}$$ | $$1$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$2$$ | $$2$$|
|$$c^{P}_{P\_DEU,GH2,RES,y}$$ | $$0.1$$ | $$0.1$$|
|$$c^{P}_{P\_DEU,CNG,RES,y}$$ | $$0.0$$ | $$0.0$$|
|$$c^{\Delta P}_{P\_DEU,GH2,RES,y}$$ | $$10$$ | $$10$$|
|$$c^{\Delta P}_{P\_DEU,CNG,RES,y}$$ | $$10$$ | $$10$$|
|$$fi^{P}_{GH2,Electricity,RES}$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Electricity,RES}$$ | $$1$$ | $$1$$|
|$$L^{P}_{GH2,RES}$$ | $$50$$ | $$50$$|
|$$L^{P}_{CNG,RES}$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,GH2,RES,y}$$ | $$10$$ | $$10$$|
|$$\Lambda^{P}_{P\_DEU,CNG,RES,y}$$ | $$0$$ | $$0$$|
|$$\Lambda^{I}_{P\_DEU,Electricity,Block 1,y}$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Electricity,Block 1,y}$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Electricity,Block 1,y}$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,GH2,RES,y}$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,RES,y}$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,GH2,RES,y}$$ | $$10$$ | $$10$$ |
|$$\Omega^{P}_{P\_DEU,CNG,RES,y}$$ | $$10$$ | $$10$$ |
|$$fi^{V}_{GH2,CNG}$$ | $$1$$ | $$1$$|
|$$l^{A}_{DEU\_to\_DEU,GH2}$$ | $$0$$ | $$0$$|
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$|
|$$c^{V}_{V\_DEU,GH2,CNG,y}$$ | $$0.1$$ | $$0.1$$|
|$$c^{\Delta V}_{V\_DEU,GH2,CNG,y}$$ | $$10$$ | $$10$$|
|$$\Lambda^{V}_{V\_DEU,GH2,CNG,y}$$ | $$10$$ | $$10$$|
|$$L^{V}_{GH2,CNG}$$ | $$10$$ | $$10$$|
|$$c^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$|
|$$L^{A}_{GH2}$$ | $$50$$ | $$50$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Electricity,Block 1,OnlyTimeStep,y}$$ | $$0.3$$ | $$0.3$$|
|$$c^{I_{q}}_{P\_DEU,Electricity,Block 1,OnlyTimeStep,y}$$ | $$1$$ | $$1$$|
|$$av^{I}_{P\_DEU,Electricity,Block 1,OnlyTimeStep}$$ | $$1$$ | $$1$$|
|$$\alpha^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$| $$0$$ | $$0$$|
|$$\beta^{D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$-1$$ | $$-1$$|

## Test Criteria
|Expression|Result y=2020|Result y=2021|
|:----- | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,GH2,Block 1,OnlyTimeStep,y}$$ | $$0.00$$ | $$0.00$$|
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$1.25$$| $$1.25$$|

## Graphical Solution
### Inverse Demand and Marginalized Cost Curves
#### GH2 2020
![test_case_2a_graphic](../../images/test_case_2a_graphic.pdf)
#### GH2 2021
![test_case_2b_graphic](../../images/test_case_2b_graphic.pdf)
#### CNG 2020
![test_case_2a_graphic](../../images/test_case_2c_graphic.pdf)
#### CNG 2021
![test_case_2b_graphic](../../images/test_case_2d_graphic.pdf)