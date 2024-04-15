# Test Case 10
Test Case 10 is structurally similar to [Test Case 5](@ref), but 10% losses between time steps are incurred in addition to $$0.1$$ of extraction costs. The tables below depict the sets and parameters, respectively. Marginalized provision costs from low to high demand time step are hence $$MC=1.1$$. Tests are passed, if prices are $$P=1.1$$ and $$P=0$$ in high and low demand time steps.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU, CNG)\}$$|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{L,H\}$$|
|$$\mathcal{N}$$ | $$\{DEU\}$$|
|$$\mathcal{O}$$ | $$\{FES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | $$\{S\_DEU\}$$|
|$$\mathcal{T}$$ | $$\{T\_DEU\}$$|
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | $$\{2020\}$$|

## Parameters
|Parameter|m=L|m=H|
|:----- | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$|
|$$r_{2020}$$ | $$1$$ | $$1$$|
|$$d_{m}$$ | $$2$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,2020}$$ | $$0.4$$ | $$0.4$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,2020}$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,2020}$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,2020}$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,2020}$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,2020}$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,2020}$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,2020}$$ | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$|
|$$l^{S}_{CNG,m,L}$$ | $$0$$ | $$0$$|
|$$l^{S}_{CNG,m,H}$$ | $$0.1$$ | $$0$$|
|$$c^{S_{in}}_{S\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$c^{S}_{S\_DEU,CNG,2020}$$ | $$0.1$$ | $$0.1$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$\Omega^{S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$L^{S}_{CNG}$$ | $$10$$ | $$10$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0.5$$ | $$1$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,m}$$ | $$1$$ | $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$-1$$|

## Test Criteria
|Expression|Result m=L|Result m=H|
|:----- | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2020}$$ | $$0.0$$ | $$1.1$$|

## Graphical Solution
### Marginalized Provision Costs and Prices for Different Time Steps
#### Time Step L
![test_case_10a_graphic](../../images/test_case_10a_graphic.pdf)
#### Time Step H
![test_case_10b_graphic](../../images/test_case_10b_graphic.pdf)