# Functional Test 1
Functional Test 1 tests correct scaling of operational and investment costs. Parameter values are checked against for two nodes, where one is half as expensive as the other. In addition, country-specific exertion of market power is tested. For transport related data, it is asserted that cost scaling corresponds to the cheaper of the two nodes. The implementation is trivial, please see the corresponding code. The table below depicts an overview of tested parameters. 

## Overview of Tested Parameters

|Parameter|Type of Check|
|:----- | ---: |
|$${1}^{NC}$$ | Specific Market Power|
|$$c^{P}$$ | Node specific scaling|
|$$c^{\Delta P}$$ | Node specific scaling|
|$$c^{V}$$ | Node specific scaling|
|$$c^{\Delta V}$$ | Node specific scaling|
|$$c^{\Delta^{RV}}$$ | Node specific scaling|
|$$c^{A}$$ | Node specific scaling|
|$$c^{\Delta A}$$ | Node specific scaling|
|$$c^{\Delta^{RA}}$$ | Node specific scaling|
|$$c^{S_{in}}$$ | Node specific scaling|
|$$c^{S_{out}}$$ | Node specific scaling|
|$$c^{\Delta S}$$ | Node specific scaling|
|$$c^{\Delta^{RS}}$$ | Node specific scaling