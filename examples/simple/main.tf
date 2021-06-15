module "simple_policy_set" {
  source = "../../"

  policy_set = {
    name             = "simple_policy_set"
    display_name     = "Simple Policy Set Defintion example"
    description      = "An example deployment of a simple policy set (initiative) using the Terraform module."
    management_group = "im"
  }

  parameters = <<PARAMETERS
  {
      "emailSecurityContact": {
        "type": "string",
        "metadata": {
          "displayName": "Security contacts email address",
          "description": "Provide email address for Azure Security Center contact details"
        }
      },
      "logAnalytics": {
        "type": "String",
        "metadata": {
          "displayName": "Primary Log Analytics workspace",
          "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
          "strongType": "omsWorkspace"
        }
      },
      "ascExportResourceGroupName": {
        "type": "String",
        "metadata": {
          "displayName": "Resource Group name for the export to Log Analytics workspace configuration",
          "description": "The resource group name where the export to Log Analytics workspace configuration is created. If you enter a name for a resource group that doesn't exist, it'll be created in the subscription. Note that each resource group can only have one export to Log Analytics workspace configured."
        }
      },
      "ascExportResourceGroupLocation": {
        "type": "String",
        "metadata": {
          "displayName": "Resource Group location for the export to Log Analytics workspace configuration",
          "description": "The location where the resource group and the export to Log Analytics workspace configuration are created."
        }
      },
      "pricingTierVMs": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for Virtual Machines",
          "description": "Azure Defender pricing tier for Virtual Machines"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierSqlServers": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for SQL Servers",
          "description": "Azure Defender pricing tier for SQL Servers"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierAppServices": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for App Services",
          "description": "Azure Defender pricing tier for App Services"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierStorageAccounts": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for Storage Accounts",
          "description": "Azure Defender pricing tier for Storage Accounts"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierSqlServerVirtualMachines": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for SQL Server Virtual Machines",
          "description": "Azure Defender pricing tier for SQL Server Virtual Machines"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierKubernetesService": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for AKS",
          "description": "Azure Defender pricing tier for AKS"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierContainerRegistry": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for ACR",
          "description": "Azure Defender pricing tier for ACR"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierKeyVaults": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for AKV",
          "description": "Azure Defender pricing tier for AKV"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierDns": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for DNS",
          "description": "Azure Defender pricing tier for DNS"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      },
      "pricingTierArm": {
        "type": "string",
        "metadata": {
          "displayName": "Azure Defender pricing tier for Azure Resource Manager",
          "description": "Azure Defender pricing tier for Azure Resource Manager"
        },
        "allowedValues": [
          "Standard",
          "Free"
        ],
        "defaultValue": "Standard"
      }
  }
PARAMETERS

  policy_definition = {
    "defenderForVM" = {
      "policyDefinitionReferenceId" : "defenderForVM",
      "policyDefinitionId" : "/providers/Microsoft.Management/managementgroups/im/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-VMs",
      "parameters" = <<PARAMETERS
      {
        "pricingTier" : {
          "value" : "[parameters('pricingTierVMs')]"
        }
      }
PARAMETERS
      "groupNames" : []
    },
    "defenderForSqlServers" = {
      "policyDefinitionReferenceId" : "defenderForSqlServers",
      "policyDefinitionId" : "/providers/Microsoft.Management/managementgroups/im/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-Sql",
      "parameters" = <<PARAMETERS
      {
        "pricingTier" : {
          "value" : "[parameters('pricingTierSqlServers')]"
        }
      }
PARAMETERS
      "groupNames" : []
    }
  }

}

