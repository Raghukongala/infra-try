variable "region" {
  description = "AWS region used for the Organizations API provider."
  type        = string
}

variable "account_access_role_name" {
  description = "IAM role created in each new member account for management-account access."
  type        = string
}

variable "accounts" {
  description = "Member accounts to create, keyed by a stable Terraform identifier. Each email must be unique and able to receive AWS account messages."
  type = map(object({
    name  = string
    email = string
    ou    = string
  }))
  validation {
    condition = alltrue([
      for account in values(var.accounts) : contains(
        ["security", "infrastructure", "workloads", "sandbox"],
        account.ou
      )
    ])
    error_message = "Each account ou must be security, infrastructure, workloads, or sandbox."
  }
}