# Test Case 16
Test Case 16 is similar to [Test Case 14](@ref), except that storage capacity expansion is disallowed. The tables below depict the sets and parameters, respectively. Since no storage is possible now, prices must be equal to inverse demand intercepts. Tests are passed, if high demand prices in 2020, 2025 and 2030 are 0, 2 and 0.98, respectively and zero during low demand time steps. Further, no capacity expansions are allowed to happen for the test to pass. Passing criteria can be seen below, while the [figure](@ref test_case_16_graphical_solution) depicts a graphical solution. 

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
|$$c^{S}_{S\_DEU,CNG,m,H,2020}$$ | $$0.05$$ | $$0.05$$|
|$$c^{S}_{S\_DEU,CNG,m,H,2025}$$ | $$0.05$$ | $$0.05$$|
|$$c^{S}_{S\_DEU,CNG,m,H,2030}$$ | $$0.05$$ | $$0.05$$|
|$$c^{S}_{S\_DEU,CNG,m,L,2020}$$ | $$0.05$$ | $$0.05$$|
|$$c^{S}_{S\_DEU,CNG,m,L,2025}$$ | $$0.05$$ | $$0.05$$|
|$$c^{S}_{S\_DEU,CNG,m,L,2030}$$ | $$0.05$$ | $$0.05$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2020}$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2025}$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta S}_{S\_DEU,CNG,2030}$$ | $$0.25$$ | $$0.25$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$\Lambda^{S}_{S\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|
|$$\Omega^{S}_{S\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$\Omega^{S}_{S\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$\Omega^{S}_{S\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|
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
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2025}$$ | $$0.0$$ | $$2.0$$|
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,m,2030}$$ | $$0.0$$ | $$0.99$$|
|$$\Delta^{S}_{S\_DEU,CNG,2020}$$ | $$0$$ | $$0$$|
|$$\Delta^{S}_{S\_DEU,CNG,2025}$$ | $$0$$ | $$0$$|
|$$\Delta^{S}_{S\_DEU,CNG,2030}$$ | $$0$$ | $$0$$|

## [Graphical Solution](@id test_case_16_graphical_solution)
### Marginalized Provision Costs and Prices
#### Time Step L 2020
![test_case_16a_graphic](../../images/test_case_16a_graphic.pdf)
#### Time Step H 2020
![test_case_16b_graphic](../../images/test_case_16b_graphic.pdf)
#### Time Step L 2025
![test_case_16c_graphic](../../images/test_case_16c_graphic.pdf)
#### Time Step H 2025
![test_case_16d_graphic](../../images/test_case_16d_graphic.pdf)
#### Time Step L 2030
![test_case_16e_graphic](../../images/test_case_16e_graphic.pdf)
#### Time Step H 2030
![test_case_16f_graphic](../../images/test_case_16f_graphic.pdf)