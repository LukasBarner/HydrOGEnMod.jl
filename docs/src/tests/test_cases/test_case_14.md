# Test Case 14
Test Case 14 tests capacity expansion, scaling of investment costs and lifetimes for storage. The set-out is similar to [Test Case 5](@ref), only that there exist multiple years and no exogenous storage capacities. If provision costs (including investments) are sufficiently low in comparison to willingness to pay, investments are made to expand non-existing storage. The tables below depict the sets and parameters, respectively. Tests pass if capacity expansion of 1 only happens in 2020, and prices are 0 in all low-demand time steps, and 0, 1 and 0.99 in high-demand time steps of 2020, 2025 and 2030, respectively. Passing criteria can be seen below, while the [figure](@ref test_case_14_graphical_solution) depicts a graphical solution.

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
|$$\mathcal{Y}$$ | $$\{2020,2025,2030\}$$|

## Parameters
|Parameter|m=L|m=H|
|:----- | ---: | ---: | 
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$|
|$$r_{2020}$$ | $$1$$ | $$1$$|
|$$r_{2025}$$ | $$1$$ | $$1$$|
|$$r_{2030}$$ | $$1$$ | $$1$$|
|$$d_{m}$$ | $$2$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,2020}$$ | $$0.4$$ | $$0.4$$|
|$$c^{P}_{P\_DEU,CNG,FES,2025}$$ | $$0.4$$ | $$0.4$$|
|$$c^{P}_{P\_DEU,CNG,FES,2030}$$ | $$0.4$$ | $$0.4$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,2020}$$ | $$1$$ | $$1$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,2025}$$ | $$1$$ | $$1$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,2030}$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,2020}$$ | $$10$$ | $$10$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,2025}$$ | $$10$$ | $$10$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,2030}$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,2020}$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,2025}$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,2030}$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,2020}$$ | $$0$$ | $$0$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,2025}$$ | $$0$$ | $$0$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,2030}$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,2020}$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,2025}$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,2030}$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,2020}$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,2025}$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,2030}$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,2020}$$ | $$10$$  | $$10$$ |
|$$\Omega^{P}_{P\_DEU,CNG,FES,2025}$$ | $$10$$  | $$10$$ |
|$$\Omega^{P}_{P\_DEU,CNG,FES,2030}$$ | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$|
|$$l^{S}_{CNG,m,L}$$ | $$0$$ | $$0$$|
|$$l^{S}_{CNG,m,H}$$ | $$0$$ | $$0$$|
|$$c^{S_{in}}_{S\_DEU,CNG,2020}$$ | $$0.025$$ | $$0.025$$|
|$$c^{S_{in}}_{S\_DEU,CNG,2025}$$ | $$0.025$$ | $$0.025$$|
|$$c^{S_{in}}_{S\_DEU,CNG,2030}$$ | $$0.025$$ | $$0.025$$|
|$$c^{S_{out}}_{S\_DEU,CNG,2020}$$ | $$0.025$$ | $$0.025$$|
|$$c^{S_{out}}_{S\_DEU,CNG,2025}$$ | $$0.025$$ | $$0.025$$|
|$$c^{S_{out}}_{S\_DEU,CNG,2030}$$ | $$0.025$$ | $$0.025$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2020}$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2025}$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2030}$$ | $$0.25$$ | $$0.25$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|
|$$\Omega^{S}_{S\_DEU,CNG,2020}$$ | $$10$$ | $$10$$|
|$$\Omega^{S}_{S\_DEU,CNG,2025}$$ | $$10$$ | $$10$$|
|$$\Omega^{S}_{S\_DEU,CNG,2030}$$ | $$10$$ | $$10$$|
|$$L^{S}_{CNG}$$ | $$5$$ | $$5$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0.5$$ | $$1.6$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,m,2025}$$ | $$0.5$$ | $$1.6$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,m,2030}$$ | $$0.5$$ | $$1.6$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,m,2020}$$ | $$0$$ | $$0$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,m,2025}$$ | $$0$$ | $$0$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,m,2030}$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,m}$$ | $$1$$ | $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$2$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,m,2025}$$ | $$0$$ | $$2$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,m,2030}$$ | $$0$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,m,2020}$$ | $$0$$ | $$-1$$|
|$$\beta^{D}_{DEU,CNG,Block 1,m,2025}$$ | $$0$$ | $$-1$$|
|$$\beta^{D}_{DEU,CNG,Block 1,m,2030}$$ | $$0$$ | $$-1$$|

## Test Criteria
|Expression|Result m=L|Result m=H|
|:----- | ---: | ---: | 
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2020}$$ | $$0.0$$ | $$0.0$$|
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2025}$$ | $$0.0$$ | $$1.0$$|
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2030}$$ | $$0.0$$ | $$0.99$$|
|$$\Delta^{S}_{S\_DEU,CNG,2020}$$ | $$1$$ | $$1$$|
|$$\Delta^{S}_{S\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$\Delta^{S}_{S\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|

## [Graphical Solution](@id test_case_14_graphical_solution)
