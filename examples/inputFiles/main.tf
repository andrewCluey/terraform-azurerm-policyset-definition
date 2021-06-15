# Find and read the file data into local Variables.
locals {
  policy_files = fileset("./data", "*.json")
  raw_data     = [for f in local.policy_files : jsondecode(file("./data/${f}"))]
}

module "custom_set" {
  for_each = { for f in local.raw_data : f.name => f }
  source   = "../../"

  policy_set = {
    name             = each.key
    display_name     = each.value.properties.displayName
    description      = each.value.properties.description
    management_group = "im"
  }

  metadata          = jsonencode("${each.value.properties.metadata}")
  parameters        = jsonencode("${each.value.properties.parameters}")
  
  policy_definition = { for p in each.value.properties.policyDefinitions : p.policyDefinitionReferenceId => p }

}
