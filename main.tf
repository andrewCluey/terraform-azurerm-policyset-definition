

resource "azurerm_policy_set_definition" "policy_set" {
  name                        = var.policy_set.name
  policy_type                 = "Custom"
  display_name                = var.policy_set.display_name
  description                 = var.policy_set.description
  management_group_name       = var.policy_set.management_group
  metadata                    = var.metadata
  parameters                  = var.parameters

  dynamic "policy_definition_reference" {
    for_each = var.policy_definition
    content {
      reference_id         = policy_definition_reference.value.policyDefinitionReferenceId
      policy_definition_id = policy_definition_reference.value.policyDefinitionId
      parameter_values     = jsonencode(policy_definition_reference.value.parameters) #lookup(policy_definition_reference.value, "parameters", null)
      policy_group_names   = lookup(policy_definition_reference.value, "groupNames", null)
    }
  }

}

