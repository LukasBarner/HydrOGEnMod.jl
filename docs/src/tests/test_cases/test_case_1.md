# Test Case 1

This test case comprises a simple example. The tables below depict the model sets and relevant parameters. If the model is solved correctly, marginalized production costs should be equal to the price. Test Case 1 passes, if prices in the single node are equal to the intersection of marginalized provision cost and inverse demand, see also the graphical solution below. Marginalized provision cost at factor intensities of 1:1 are $$MC=c^{I_{l}} + c^{I_{q}} Q + c^{P}$$, while prices are $$P(Q) = \alpha^{D} + \beta^{D} Q$$. Hence, for the given data, prices should be $P=1.5$, see also the overview of tested criteria.

## Sets
|Set Name|Set Value|
|:----- | ---: |
|$$\mathcal{A}$$ | {DEU\_to\_DEU}|
|$$\mathcal{AC}$$ | {(DEU\_to\_DEU, CNG)}|
|$$\mathcal{C}$$ | {CNG}|
|$$\mathcal{DSB}$$ | {Block 1}|
|$$\mathcal{I}$$ | {Natural Gas}|
|$$\mathcal{IOB}$$ | {Block 1}|
|$$\mathcal{M}$$ | {OnlyTimeStep}|
|$$\mathcal{N}$$ | {DEU}|
|$$\mathcal{O}$$ | {FES}|
|$$\mathcal{P}$$ | {P\_DEU}|
|$$\mathcal{RA}$$ | ∅|
|$$\mathcal{RS}$$ | ∅|
|$$\mathcal{RV}$$ | ∅|
|$$\mathcal{S}$$ | ∅|
|$$\mathcal{T}$$ | {T\_DEU}|
|$$\mathcal{V}$$ | ∅|
|$$\mathcal{VT}$$ | ∅|
|$$\mathcal{Y}$$ | {2020}

## Parameters
|Parameter|y=2020|
|:----- | ---: |
|$$\frac{1}{ \| \Delta \|_{y}}$$ | $$1$$|
|$${1}^{NC}_{T\_DEU,DEU,CNG}$$ | $$0$$|
|$$r_{y}$$ | $$1$$|
|$$d_{OnlyTimeStep}$$ | $$1$$|
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
|$$c^{I_{l}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$0.5$$|
|$$c^{I_{q}}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep,y}$$| $$1.0$$|
|$$av^{I}_{P\_DEU,Natural Gas,Block 1,OnlyTimeStep}$$| $$1.0$$|
|$$\alpha^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$2$$|
|$$\beta^{D}_{DEU,CNG,Block 1,OnlyTimeStep,y}$$| $$-1$$|

## Test Criteria
|Expression|Result y=2020|
|:----- | ---: |
|$$\tilde{P}^{T \rightarrow D}_{\text{DEU,CNG,Block 1,OnlyTimeStep,y}}$$ | $$1.5$$|

## Graphical Solution
