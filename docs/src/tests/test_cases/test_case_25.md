# Test Case 25
Test Case 25 asserts that input capacity expansion, availability of input capacity and input expansion limits work as desired. In 2020, no input capacity is available. With the corresponding investments and availabilities, a price of 1.5 materializes in 2025. No consumption should happen in 2030 and 2035 because investments are not lucrative to carry over to 2030 and because the aggregate active investments in 2035 should be 0, respectively. Below is a graphical representation of the optimal solution. Hence, this test passes if the equilibrium price is $$P=1.5$$ in 2025 and equal to the intercept of the inverse demand function in all other periods, with an objective value of 0.375 and corresponding social welfare of 0.5 (see the sum of grey areas in the figure).

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
|$$\mathcal{Y}$$ | $$\{2020,2025,2030,2035\}$$|

## Parameters
|Parameter|y=2020|y=2025|y=2030|y=2035|
|:----- | ---: | ---: | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$5$$ | $$5$$ | $$5$$ | $$5$$|
|$$\mathds{1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$r_{y}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.1$$ | $$0.1$$ | $$0.1$$ | $$0.1$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 2,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$| $$10$$ | $$10$$ | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$| $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$ | $$50$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.1$$ | $$0.1$$ | $$0.1$$  | $$0.1$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0$$  | $$0$$  | $$0$$  | $$0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$  | $$1$$  | $$1$$  | $$1$$ |
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 2,OnlyTimeStep,y}$$ | $$0.2$$  | $$0.2$$  | $$0.2$$  | $$0.2$$ |
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 2,OnlyTimeStep,y}$$ | $$0$$  | $$0$$  | $$0$$  | $$0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 2,OnlyTimeStep}$$ | $$0.5$$  | $$0.5$$  | $$0.5$$  | $$0.5$$ |
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0.25$$  | $$0.25$$ | $$0.25$$  | $$0.0$$   |
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 2,y}$$ | $$1$$  | $$1$$  | $$1$$   | $$0$$ |
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$1.5$$  | $$1.5$$  | $$1.5$$  | $$1.5$$ |
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 2,y}$$ | $$1.75$$  | $$1.75$$  | $$1.75$$ | $$1.75$$ |
|$$L^{I}_{Natural Gas}$$ | $$5$$  | $$5$$  | $$5$$  | $$5$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$ | $$0.4$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$ | $$-1$$ | $$-1$$ | $$-1$$|

## Test Criteria
|Expression|Result y=2020|Result y=2025|Result y=2030|Result y=2035|
|:----- | ---: | ---: | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$1.5$$ | $$0.4$$ | $$2$$ |
|Objective Value | | | |$$0.375$$|

## Graphical Solution
### Profit Maximization in a Cournot Setting
#### 2020
![test_case_25a_graphic](../../images/test_case_25a_graphic.pdf)
#### 2025
![test_case_25b_graphic](../../images/test_case_25b_graphic.pdf)
#### 2030
![test_case_25c_graphic](../../images/test_case_25c_graphic.pdf)
#### 2035
![test_case_25d_graphic](../../images/test_case_25d_graphic.pdf)