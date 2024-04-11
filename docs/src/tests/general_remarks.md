# General Remarks

The following sections provide a detailed account of the validation
procedures. Two types of tests are carried out, the first one being
fully scoped model tests, while the second tests specific
functionalities.

The test cases contain 28 data sets with
explanations regarding the desired solution. Every test has specific
testing criteria that ensure the model works as desired with respect to
specific functionalities. With some abuse of economic syntax, the
calculations underlying each case use the notion of marginalized
costs. Here, marginalized costs refer to the inclusion of investment
costs into marginal costs. While this step is rarely ever plausible and
hence likely counterintuitive to many economists, the specific design of
test cases allows for this measure and makes for an easier illustration. 

!!! note "An Example"
    Consider the following simple example: A good is to be provided in a certain period. Ex-ante, there do not exist any production capacities, and all investments have a lifetime such that they remain active only for a single period. It is only rational to invest as much capacity as is needed in the next time period. Hence, investment costs may also be viewed as a special type of operational cost in this case. Considering unit cost, an investment of 5 units of money to provide 5 units of commodity comes down to operational costs of 1 unit of money per 1 unit of commodity. This aggregate of operational and marginalized investment costs is henceforth termed marginalized costs.

Every test case can be run for both, the optimization model formulation
and as a complementarity problem.
However, tests for the complementarity formulation are only run for variable
values (such as quantities or prices). Tests for e.g. the objective
value are not run due to a lack of the underlying function.
The latter category of functional tests asserts other specific
functionalities such as plotting or reporting of results works as desired.

Please see below for a short overview.

## Test Case Overview

|Test Case|Explanation|
|:--- | :--- |
| [`Test Case 1`](test_cases/test_case_1.md)| Tests inverse demand and cost data.	|
| [`Test Case 2`](test_cases/test_case_2.md)| Tests multiple years with weights and includes conversion costs.|
| [`Test Case 3`](test_cases/test_case_3.md)| Tests exertion of market power with time step weights. |
| [`Test Case 4`](test_cases/test_case_4.md)| Tests discounting.|
| [`Test Case 5`](test_cases/test_case_5.md)| Tests storage and multiple time steps with more low demand weight.|
| [`Test Case 6`](test_cases/test_case_6.md)| Tests storage and multiple time steps with more high demand weight.|
| [`Test Case 7`](test_cases/test_case_7.md)| Tests same commodity from different origins.|
| [`Test Case 8`](test_cases/test_case_8.md)| Tests multiple demand commodities from same flow commodity.|
| [`Test Case 9`](test_cases/test_case_9.md)| Tests transport mechanisms including losses on arcs with time step weights.|
| [`Test Case 10`](test_cases/test_case_10.md)| Tests storage losses including multiple time steps.|
| [`Test Case 11`](test_cases/test_case_11.md)| Tests production capacity expansion, scaling of investment costs and asset lifetimes.|
| [`Test Case 12`](test_cases/test_case_12.md)| Tests conversion capacity expansion, scaling of investment costs and asset lifetimes.|
| [`Test Case 13`](test_cases/test_case_13.md)| Tests arc capacity expansion, scaling of investment costs and asset lifetimes.|
| [`Test Case 14`](test_cases/test_case_14.md)| Tests storage capacity expansion, scaling of investment costs and asset lifetimes.|
| [`Test Case 15`](test_cases/test_case_15.md)| Tests production capacity expansion limits.|
| [`Test Case 16`](test_cases/test_case_16.md)| Tests storage capacity expansion limits.|
| [`Test Case 17`](test_cases/test_case_17.md)| Tests trader sanctions.|
| [`Test Case 18`](test_cases/test_case_18.md)| Tests market power exertion in foreign markets including arc capacity expansion.|
| [`Test Case 19`](test_cases/test_case_19.md)| Tests restrictions by origin.|
| [`Test Case 20`](test_cases/test_case_20.md)| Tests repurposing of conversion facilities, including repurposing factors. |
| [`Test Case 21`](test_cases/test_case_21.md)| Tests repurposing of transportation arcs, including repurposing factors.|
| [`Test Case 22`](test_cases/test_case_22.md)| Tests repurposing of storage facilities, including repurposing factors. |
| [`Test Case 23`](test_cases/test_case_23.md)| Tests piece-wise linear operational cost for input procurement.|
| [`Test Case 24`](test_cases/test_case_24.md)| Tests demand from multiple blocks.|
| [`Test Case 25`](test_cases/test_case_25.md)| Tests input investment costs, availabilities and expansion limits.|
| [`Test Case 26`](test_cases/test_case_26.md)| Tests commodity adjacency structures for both pipeline and shipping.|
| [`Test Case 27`](test_cases/test_case_27.md)| Tests adjacency structures for arc capacity expansion.|
| [`Test Case 28`](test_cases/test_case_28.md)| Tests adjacency structures for arc capacity repurposing.|

## Functionality Tests Overview

|Test Case|Explanation|
|:----- | :--- |
|[`Functionality Test 1`](functional_tests/functional_test_1.md)| Tests correct scaling of operational and investment costs. |
|[`Functionality Test 2`](functional_tests/functional_test_2.md)| Tests input parameter exports. |
|[`Functionality Test 3`](functional_tests/functional_test_3.md)| Tests that model outputs for the convex optimization problem implementation are stored correctly. |
|[`Functionality Test 4`](functional_tests/functional_test_4.md)| Tests that model outputs for the complementarity problem implementation are stored correctly. |
|[`Functionality Test 5`](functional_tests/functional_test_5.md)| Tests that map plotting functionality works as expected. |