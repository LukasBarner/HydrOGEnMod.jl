# Test Case 3
Test Case 3 asserts exertion of market power in a simple Cournot setting with time step weights. Marginalized costs for given factor intensities are $$MC=c^{I_{l}} + c^{I_{q}}_ \cdot Q + c^{P} $$, while prices are $$P(Q) = \alpha^{D} + \beta^{D} Q$$. As there is only one trader, the model now describes a Cournot monopoly. It is known from economic theory that in a profit-maximizing solution, marginalized costs are equal to marginal revenues ($$MR=MC$$). \Cref{fig:test_3} is a graphical representation of the optimal solution. Hence, this test passes if the equilibrium price is $$P=1.5$$.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | $$\{DEU\_to\_DEU\}$$|
|$$\mathcal{AC}$$ | $$\{(DEU\_to\_DEU,CNG)\}$$|
|$$\mathcal{C}$$ | $$\{CNG\}$$|
|$$\mathcal{DSB}$$ | $$\{Block 1\}$$|
|$$\mathcal{I}$$ | $$\{Natural Gas\}$$|
|$$\mathcal{IOB}$$ | $$\{Block 1\}$$|
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
|$$\mathcal{Y}$$ | $$\{2020\}$$|

## Parameters
|Parameter|y=2020|
|:----- | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$1$$|
|$$r_{y}$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$2$$|
|$$c^{P}_{P\_DEU,CNG,FES,y}$$ | $$0.5$$|
|$$c^{\Delta P}_{P\_DEU,CNG,FES,y}$$ | $$1$$|
|$$fi^{P}_{CNG,Natural Gas,FES}$$ | $$1$$|
|$$L^{P}_{CNG,FES}$$ | $$50$$|
|$$\Lambda^{P}_{P\_DEU,CNG,FES,y}$$ | $$10$$|
|$$\Lambda^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$10$$|
|$$\Omega^{I}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$c^{\Delta^{I}}_{P\_DEU,Natural Gas,Block 1,y}$$ | $$0$$|
|$$\Lambda^{T}_{T\_DEU,DEU,CNG,FES,y}$$ | $$10$$|
|$$\Omega^{P}_{P\_DEU,CNG,FES,y}$$| $$10$$ |
|$$l^{A}_{DEU\_to\_DEU,CNG}$$| $$0$$|
|$$c^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$c^{\Delta A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$\Lambda^{A}_{DEU\_to\_DEU,CNG,y}$$ | $$0$$|
|$$L^{A}_{CNG}$$ | $$50$$|
|$$c^{I_{l}}_{P\_DEU,Electricity,Block 1,OnlyTimeStep,y}$$ | $$0.5$$|
|$$c^{I_{q}}_{P\_DEU,Electricity,Block 1,OnlyTimeStep,y}$$ | $$0$$ |
|$$av^{I}_{P\_DEU,Electricity,Block 1,OnlyTimeStep}$$ | $$1$$ |
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$|

## Test Criteria
|Expression|Result y=2020|
|:----- | ---: |
|$$\tilde{P}^{T \rightarrow D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$ | $$1.5$$|

## Graphical Solution
### Profit Maximization in a Cournot Setting
![test_case_3_graphic](../../images/test_case_3_graphic.pdf)