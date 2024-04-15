# Test Case 5
Test Case 5 asserts that storages work as intended. For this, multiple time steps are introduced. During the low demand time step L, there is no demand for natural gas, but production is sufficiently cheaper than in the high demand time step H. In a loss-free system of perfect competition with factor intensities of 1:1, prices in the high-demand time step should be the sum of marginalized input, production, and storage costs of the marginal supplying time step. The tables below show the test data. Producing natural gas and selling CNG in time step L and storing it to time step H, implies marginalized provision cost of $$MC=1$$, much cheaper than producing in H, which would lead to marginalized provision cost of $$MC=1.4$$. Since no demand occurs in time step L, this option remains feasible; The graphic below depicts a graphical solution. Hence, the test is passed if $$P_H=1,P_L=0$$ and production is $$0.0$$ and $$0.5$$ during high and low demand time steps, respectively. Note that the low demand time step has twice the weight (i.e. twice as many hours or days), hence only half the demanded quantity must be injected into storage every day.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU,CNG)\}$$|
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
|$$\mathcal{Y}$$ | $$\{2020\}$$

## Parameters
|Parameter|m=L|m=H|
|:----- | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$|
|$$r_{2020}$$ | $$1$$ | $$1$$|
|$$d_{m}$$ | $$4$$ | $$2$$|
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
|$$l^{S}_{CNG,m,H}$$ | $$0$$ | $$0$$|
|$$c^{S_{in}}_{S\_DEU,CNG,2020}$$ | $$0.05$$ | $$0.05$$|
|$$c^{S_{out}}_{S\_DEU,CNG,2020}$$ | $$0.05$$ | $$0.05$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$\Omega^{S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$L^{S}_{CNG}$$ | $$10$$ | $$10$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0.5$$ | $$1.0$$ |
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0$$ | $$0$$ |
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,m}$$ | $$1$$ | $$1$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$-1$$

## Test Criteria
|Expression|Result m=L|Result m=H|
|:----- | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2020}$$ | $$0.0$$ | $$1.0$$|
|$$q^{I}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0.5$$ | $$0.0$$

## Graphical Solution
### Marginalized Provision Costs and Prices for Different Time Steps
#### Time Step L
![test_case_5a_graphic](../../images/test_case_5a_graphic.pdf)
#### Time Step H
![test_case_5b_graphic](../../images/test_case_5b_graphic.pdf)