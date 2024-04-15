# Test Case 9
Test Case 9 is used to verify functionality and losses on transportation arcs with time step weights. The tables below depict the sets and parameters, respectively. Production costs in $$DEU$$ are much too high. However, $$NLD$$ has no own demand and can export to $$DEU$$ with operational cost of $$0.1$$ and losses of 10%. In addition to production and conversion costs of $$1$$, 10% must be produced on top, and operational costs of $$0.1$$ follow. Marginalized provision costs are hence $$1.2$$. Tests are passed, if prices are $$1.2$$ and $$0$$ in $$DEU$$ and $$NLD$$, respectively. Further, $$0.88$$ must be produced in $$NLD$$, corresponding to a consumption quantity of $$0.8$$ in $$DEU$$.

The implementation in the testing routine features two separate runs for shipping and pipelines (denoted by case 9a and 9b), however, mathematical model data remain unchanged. 

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU,DEU\_to\_NLD,NLD\_to\_DEU,NLD\_to\_NLD\}$$|
|$$\mathcal{AC}$$ | $$\begin{aligned}\{(DEU\_to\_DEU, CNG),(DEU\_to\_NLD, CNG), \\ (NLD\_to\_DEU, CNG),(NLD\_to\_NLD, CNG)\} \end{aligned}$$|
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
|$$\mathcal{Y}$$ | $$\{2020\}$$

## Parameters
|Parameter|y=2020|
|:----- | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$|
|$${1}^{NC}_{T\_DEU,NLD,CNG}$$ | $$0$$|
|$${1}^{NC}_{T\_NLD,DEU,CNG}$$ | $$0$$|
|$${1}^{NC}_{T\_NLD,NLD,CNG}$$ | $$0$$|
|$$r_{y}$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$2$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.5$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$|
|$$c^{P}_{P\_NLD,CNG,FES,y}$$ | $$0.5$$|
|$$c^{\Delta P}_{P\_NLD,CNG,FES,y}$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{T}_{T\_DEU,NLD,CNG,FES,y}$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$| $$10$$ |
|$$\Lambda^{P}_{P\_NLD,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$10$$|
|$$\Omega^{I}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_NLD,Natural Gas,Block 1,y}$$ | $$0$$|
|$$\Lambda^{T}_{T\_NLD,DEU,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{T}_{T\_NLD,NLD,CNG,FES,y}$$ | $$10$$|
|$$\Omega^{P}_{P\_NLD,CNG,FES,y}$$| $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$| $$0.0$$|
|$$l^{A}_{DEU\_to\_NLD,CNG}$$| $$0.0$$|
|$$l^{A}_{NLD\_to\_DEU,CNG}$$| $$0.1$$|
|$$l^{A}_{NLD\_to\_NLD,CNG}$$| $$0.0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0.0$$|
|$$c^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$0.0$$|
|$$c^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$0.1$$|
|$$c^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0.0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_NLD,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{NLD\_to\_DEU,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{NLD\_to\_NLD,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_NLD,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{NLD\_to\_DEU,CNG,y}$$ | $$10$$|
|$$\Lambda^{A}_{NLD\_to\_NLD,CNG,y}$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$1$$|
|$$c^{I_{l}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0.5$$|
|$$c^{I_{q}}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0$$|
|$$av^{I}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep}$$| $$1$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$|
|$$\alpha^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$| $$0$$|
|$$\beta^{D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$

## Test Criteria
|Expression|Result y=2020|
:----- | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$1.2$$ |
|$$\tilde{P}^{T \rightarrow D}_{NLD,CNG,Block 1,OnlyTimeStep,y}$$ | $$0.0$$ |
|$$q^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.0$$ |
|$$q^{I}_{P\_NLD,Natural Gas,Block 1,OnlyTimeStep,y}$$ | $$0.88$$ | 

## Graphical Solution
### Marginalized Provision Costs and Prices for Different Nodes
#### NLD
![test_case_9a_graphic](../../images/test_case_9a_graphic.pdf)
#### DEU
![test_case_9b_graphic](../../images/test_case_9b_graphic.pdf)