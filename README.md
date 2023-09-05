# caf-enterprise-scale

## Default configuration

The default configuration (see [here](https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BUser-Guide%5D-Getting-Started#provisioning-instructions)) creates the following Azure resources:


 | Terraform resource                                                                         | Azure resource/concept                 | Count |
 |:-------------------------------------------------------------------------------------------|:---------------------------------------|------:|
 | [`azurerm_management_group`](azurerm_management_group)                                     | [Management group](management-group)   |     8 |
 | [`azurerm_policy_definition`](azurerm_policy_definition)                                   | [Policy definition](policy-definition) |   124 |
 | [`azurerm_policy_set_definition`](azurerm_policy_set_definition)                           | [Policy initiative](policy-initiative) |    12 |
 | [`azurerm_management_group_policy_assignment`](azurerm_management_group_policy_assignment) | [Policy assignment](policy-assignment) |    36 |
 | [`azurerm_role_definition`](azurerm_role_definition)                                       | [Role definition](role-definition)     |     5 |
 | [`azurerm_role_assignment`](azurerm_role_assignment)                                       | [Role assignment](role-assignment)     |    31 |
 | [`azurerm_subscription_template_deployment`](azurerm_subscription_template_deployment)     | Subscription template deployment       |     1 |

### Notes

- The `azurerm_subscription_template_deployment` resource is only used for usage data collection by Microsoft ("telemetry") which can be disabled with the `disable_telemetry` input parameter of the module
- All policy definitions and policy set definitions have `management_group_id` set to the level 1 management group (Enterprise-Scale)
- The policy set definitions (policy initiatives) reference a subset of the custom policies defined in the module as well as built-in policies
- The relation between policy sets, custom policies, and built-in policies is as follows (more details in [Policies](#policies.md)):
    | Type                                              | Count |
    |---------------------------------------------------|-------|
    | Custom policies referenced in **no** policy set   | 43    |
    | Custom policies referenced in **one** policy set  | 81    |
    | References to built-in policies in policy sets    | 135   |
    | Uniqe built-in policies referenced in policy sets | 125   |
- Policies are assigned **only** to management groups
- Policies **and** policy sets are assigned to management groups
- Both custom policies and policy sets **and** built-in policies and policy sets are assigned to management groups
- Only a subset of the custom policies and policy sets are assigned to management groups
- Some policies or policy sets are assigned to multiple management groups
- The relation between policies, policy sets, and management group assignments is as follows:
    | Type                                                          | Count |
    |---------------------------------------------------------------|-------|
    | Assignments of policies and policy sets to management groups  | 36    |
    | Unique policies and policy sets assigned to management groups | 31    |
    | Assignments of built-in policies to management groups         | 18    |
    | Assignments of built-in policy sets to management groups      | 6     |
    | Assignments of custom policies to management groups           | 8     |
    | Assignments of custom policy sets to management groups        | 5     |
- All custom role definitions have the scope `/providers/Microsoft.Management/managementGroups/es`
- Role assignments are scoped to the different landing zone management groups
- None of the custom roles are used in role assignments
  - Only built-in roles are assigned
- All role assignments have a ServicePrincipal as target
- Some role assignments target the same service principal
- All target service principals are created by the module
- The relation between role assignments and service principals is as follows:
    | Type                                   | Count |
    |----------------------------------------|-------|
    | Role assignments to service principals | 31    |
    | Unique service principals as targets   | 19    |

[management-group]: https://learn.microsoft.com/en-us/azure/governance/management-groups/
[policy-assignment]: https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure
[policy-definition]: https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure
[policy-initiative]: https://learn.microsoft.com/en-us/azure/governance/policy/concepts/initiative-definition-structure
[role-definition]: https://learn.microsoft.com/en-gb/azure/role-based-access-control/role-definitions
[role-assignment]: https://learn.microsoft.com/en-gb/azure/role-based-access-control/role-assignments

[azurerm_management_group_policy_assignment]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_policy_assignment
[azurerm_management_group]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group
[azurerm_policy_definition]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition
[azurerm_policy_set_definition]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_set_definition
[azurerm_role_definition]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition
[azurerm_role_assignment]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
[azurerm_subscription_template_deployment]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_template_deployment
