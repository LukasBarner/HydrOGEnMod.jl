# Test Case 22
Test Case 22 asserts that repurposing of storage capacities works as intended, including repurposing factors. The tables below describe an extended version of [Test Case 5](@ref) with two commodities and years instead of one. In addition, an overview of test criteria and a graphical solution is displayed.


## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU, CNG), (DEU\_to\_DEU, GH2)\}$$|
|$$\mathcal{C}$$ | $$\{CNG,GH2\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{L,H\}$$|
|$$\mathcal{N}$$ | $$\{DEU\}$$|
|$$\mathcal{O}$$ | $$\{FES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | $$\{(CNG,GH2)\}$$|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | $$\{S\_DEU\}$$|
|$$\mathcal{T}$$ | $$\{T\_DEU\}$$|
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | $$\{2020,2021\}$$|

## Parameters
|Parameter|y=2020 m=L|y=2020 m=H|y=2021 m=L|y=2021 m=H|
|:----- | ---: |---: |---: |---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_DEU,DEU,GH2}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$r_{y}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$d_{m}$$ | $$2$$ | $$1$$ | $$2$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.4$$ | $$0.4$$ | $$0.4$$ | $$0.4$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$c^{P}_{P\_DEU,GH2,FES,y}$$ | $$0.3$$ | $$0.3$$ | $$0.3$$ | $$0.3$$|
|$$c^{\Delta P}_{P\_DEU,GH2,FES,y}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$fi^{P}_{GH2,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{GH2,FES}$$ | $$50$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,GH2,FES,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,DEU,GH2,FES,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$  | $$10$$ |
|$$\Omega^{P}_{P\_DEU,GH2,FES,y}$$ | $$10$$  | $$10$$  | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$l^{A}_{DEU\_to\_DEU,GH2}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,GH2,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$ | $$50$$ | $$50$$|
|$$L^{A}_{GH2}$$ | $$50$$ | $$50$$ | $$50$$ | $$50$$|
|$$l^{S}_{CNG,m,L}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$l^{S}_{CNG,m,H}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{S_{in}}_{S\_DEU,CNG,y}$$ | $$0.05$$ | $$0.05$$ | $$0.05$$ | $$0.05$$|
|$$c^{S_{out}}_{S\_DEU,CNG,y}$$ | $$0.05$$ | $$0.05$$ | $$0.05$$ | $$0.05$$|
|$$c^{\Delta S}_{S\_DEU,CNG,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$l^{S}_{GH2,m,L}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$l^{S}_{GH2,m,H}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{S}_{S\_DEU,GH2,m,H,y}$$ | $$0.1$$ | $$0.1$$ | $$0.1$$ | $$0.1$$|
|$$c^{S}_{S\_DEU,GH2,m,L,y}$$ | $$0.1$$ | $$0.1$$ | $$0.1$$ | $$0.1$$|
|$$c^{\Delta S}_{S\_DEU,GH2,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$c^{\Delta^{RS}}_{S\_DEU,CNG,GH2,y}$$  | $$0.05$$ | $$0.05$$ | $$0.025$$ | $$0.025$$|
|$$f^{RS}_{CNG,GH2}$$  | $$0.5$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$\Lambda^{S}_{S\_DEU,CNG,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{S}_{S\_DEU,GH2,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{S}_{S\_DEU,CNG,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{S}_{S\_DEU,GH2,y}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$L^{S}_{CNG}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$L^{S}_{GH2}$$ | $$10$$ | $$10$$ | $$10$$ | $$10$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,m,y}$$ | $$0.5$$ | $$1$$ | $$0.5$$ | $$1$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,m,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,m}$$ | $$1$$ | $$1$$ | $$1$$ | $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,m,y}$$ | $$0$$ | $$2$$ | $$0$$ | $$0$$|
|$$\beta^{D}_{DEU,CNG,Block 1,m,y}$$ | $$0$$ | $$-1$$ | $$0$$ | $$0$$|
|$$\alpha^{D}_{DEU,GH2,Block 1,m,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$2$$|
|$$\beta^{D}_{DEU,GH2,Block 1,m,y}$$ | $$0$$ | $$0$$ | $$0$$ | $$-1$$|

## Test Criteria
|Expression|Result y=2020 m=L|Result y=2020 m=H|Result y=2021 m=L|Result y=2021 m=H|
|:----- | ---: |---: |---: |---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,y}$$ | $$0.0$$ | $$1.0$$ | $$0.0$$ | $$0.0$$ |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$ | $$1.0$$|
|$$q^{I}_{P\_DEU,Natural Gas,Block 1,m,y}$$ | $$0.5$$ | $$0.0$$ | $$0.5$$ | $$0.0$$|

## Graphical Solution
### Illustration for Different Years, Commodities and Time Steps
#### Time Step L for CNG in 2020
![test_case_22a_graphic](../../images/test_case_22a_graphic.pdf)
#### Time Step H for CNG in 2020
![test_case_22b_graphic](../../images/test_case_22b_graphic.pdf)
#### Time Step L for CNG in 2021
![test_case_22c_graphic](../../images/test_case_22c_graphic.pdf)
#### Time Step H for CNG in 2021
![test_case_22d_graphic](../../images/test_case_22d_graphic.pdf)
#### Time Step L for GH2 in 2020
![test_case_22e_graphic](../../images/test_case_22e_graphic.pdf)
#### Time Step H for GH2 in 2020
![test_case_22f_graphic](../../images/test_case_22f_graphic.pdf)
#### Time Step L for GH2 in 2021
![test_case_22g_graphic](../../images/test_case_22g_graphic.pdf)
#### Time Step H for GH2 in 2021
![test_case_22h_graphic](../../images/test_case_22h_graphic.pdf)