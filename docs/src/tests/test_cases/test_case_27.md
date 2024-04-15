# Test Case 27
Test Case 27 is used to assert correct working of adjacency structures for arc capacity expansion. All parameters are the same as in [Test Case 13](@ref), however commodity-specific adjacency prohibits flows (since $\mathcal{AC}$ is empty). The tables below depict the sets and parameters. In addition, tests and a graphical solution are depicted. 

The implementation in the testing routine features two separate runs for shipping and pipelines (denoted by case 27a and 27b), however, mathematical model data remain unchanged. 

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU,DEU\_to\_NLD,NLD\_to\_DEU,NLD\_to\_NLD\}$$|
|$$\mathcal{AC}$$ | ∅|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
|$$\mathcal{M}$$ | $$\{OnlyTimeStep\}$$|
|$$\mathcal{N}$$ | $$\{DEU,NLD\}$$|
|$$\mathcal{O}$$ | $$\{FES\}$$|
|$$\mathcal{P}$$ | $$\{P\_DEU,P\_NLD\}$$|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | ∅|
|$$\mathcal{T}$$ | $$\{T\_DEU,T\_NLD\}$$|
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | $$\{2020,2025,2030\}$$|

## Parameters
|Parameter|y=2020|y=2025|y=2030|
|:----- | ---: | ---: | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$ | $$1$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_DEU,NLD,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_NLD,DEU,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$${1}^{NC}_{T\_NLD,NLD,CNG}$$ | $$0$$ | $$0$$ | $$0$$|
|$$r_{y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.4$$ | $$0.4$$ | $$0.4$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{P}_{P\_NLD,CNG,FES,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$c^{\Delta P}_{P\_NLD,CNG,FES,y}$$ | $$1$$ | $$1$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$ | $$1$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$ | $$50$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,NLD,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$\Lambda^{P}_{P\_NLD,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{I}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{I}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{T}_{T\_NLD,DEU,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Lambda^{T}_{T\_NLD,NLD,CNG,FES,y}$$ | $$10$$ | $$10$$ | $$10$$|
|$$\Omega^{P}_{P\_NLD,CNG,FES,y}$$ | $$10$$  | $$10$$  | $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$l^{A}_{DEU\_to\_NLD,CNG}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$l^{A}_{NLD\_to\_DEU,CNG}$$ | $$0.1$$ | $$0.1$$ | $$0.1$$|
|$$l^{A}_{NLD\_to\_NLD,CNG}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$0.05$$ | $$0.05$$ | $$0.05$$|
|$$c^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0.0$$ | $$0.0$$ | $$0.0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta A}_{DEU\_to\_NLD,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta A}_{NLD\_to\_DEU,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$c^{\Delta A}_{NLD\_to\_NLD,CNG,y}$$ | $$0.25$$ | $$0.25$$ | $$0.25$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\Lambda^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$ | $$50$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$ | $$2$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$c^{I_{l}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.5$$ | $$0.5$$ | $$0.5$$|
|$$c^{I_{q}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$av^{I}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep}$$ | $$1$$ | $$1$$ | $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$2$$ | $$2$$ | $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$-1$$ | $$-1$$ | $$-1$$|
|$$\alpha^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$0$$ | $$0$$|
|$$\beta^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$-1$$ | $$-1$$ | $$-1$$|

## Test Criteria
|Expression|Result y=2020|Result y=2025|Result y=2030|
|:----- | ---: | ---: | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$0$$ | $$2$$ | $$0.99$$ |
|$$\tilde{P}^{T \rightarrow D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$0.0$$| $$0.0$$| $$0.0$$ |
|$$\Delta^{A}_{DEU\_to\_DEU,CNG,y}$$ | N.E.  | N.E.  | N.E. |
|$$\Delta^{A}_{DEU\_to\_NLD,CNG,y}$$ | N.E.  | N.E.  | N.E. |
|$$\Delta^{A}_{NLD\_to\_DEU,CNG,y}$$ | N.E.  | N.E.  | N.E. |
|$$\Delta^{A}_{NLD\_to\_NLD,CNG,y}$$ | N.E.  | N.E.  | N.E. |

## Graphical Solution
### Marginalized Provision Costs and Prices
Note: Marginalized costs are depicted as if adjacency was given.
#### NLD 2020
![test_case_27a_graphic](../../images/test_case_27a_graphic.pdf)
#### DEU 2020
![test_case_27b_graphic](../../images/test_case_27b_graphic.pdf)
#### NLD 2025
![test_case_27c_graphic](../../images/test_case_27c_graphic.pdf)
#### DEU 2025
![test_case_27d_graphic](../../images/test_case_27d_graphic.pdf)
#### NLD 2030
![test_case_27e_graphic](../../images/test_case_27e_graphic.pdf)
#### DEU 2030
![test_case_27f_graphic](../../images/test_case_27f_graphic.pdf)