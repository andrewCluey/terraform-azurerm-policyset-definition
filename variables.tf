# Policy Set variables

variable "policy_set" {
  type = object({
    name         = string
    display_name = string
    description  = string
    management_group = string
  })
  description = "description"
  default     = null
}



variable "metadata" {
  type        = string
  description = ""
  default     = null
}


variable "parameters" {
  type        = string
  description = "description"
  default     = null
}


variable "policy_definition" {
  type        = any
  description = "An optional block "
  default     = null
/*

*/
}

