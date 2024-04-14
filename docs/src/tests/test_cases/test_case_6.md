# Test Case 6
Test Case 6 works similar to [Test Case 5](@ref), but here the low demand time step has half the weight. Prices remain unchanged, however the low-demand production quantity per timestep should be twice as high as consumption in the high-demand time step. The test is passed if $$P_H=1,P_L=0$$ and production is $$0.0$$ and $$2.0$$ during high and low demand time steps, respectively.

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
|$$\mathcal{Y}$$ | $$\{2020\}$$|

## Parameters
|Parameter|m=L|m=H|
|:----- | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$|
|$$r_{2020}$$ | $$1$$ | $$1$$|
|$$d_{m}$$ | $$2$$ | $$4$$|
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
|$$\beta^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$-1$$|

## Test Criteria
|Expression|Result m=L|Result m=H|
|:----- | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2020}$$ | $$0.0$$ | $$1.0$$|
|$$q^{I}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$2.0$$ | $$0.0$$|

## Graphical Solution
