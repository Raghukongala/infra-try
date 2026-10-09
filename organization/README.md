# AWS Organizations

This is a separate Terraform root for organization-level resources. The existing root directory remains the EC2 workload deployment for dev, uat, and prd.

## Prerequisites

- Use AWS credentials for the AWS Organizations management account. Do not run this configuration with a member-account profile.
- The management account must be able to create Organizations, organizational units, SCPs, and member accounts.
- Configure remote Terraform state and state locking before using this for a team or production organization.
- If the management account already belongs to an organization, import that organization into Terraform state before planning. Do not apply a second organization resource.

## Plan and apply

Run these commands from the repository root:

```powershell
terraform -chdir=organization init
terraform -chdir=organization plan -var-file=organization.tfvars
terraform -chdir=organization apply -var-file=organization.tfvars
```

The initial configuration creates the organization with all features enabled, four organizational units, a root-attached SCP preventing member accounts from leaving the organization, and an organization-wide multi-region CloudTrail trail. The trail writes to a private, versioned, SSE-S3 encrypted bucket with public access blocked. It does not create member accounts until `accounts` is configured.

## Create member accounts

Set the `accounts` map in `organization/organization.tfvars` to create member accounts. Use unique email addresses that you control:

```hcl
accounts = {
  security = {
    name  = "security"
    email = "aws-security@example.com"
    ou    = "security"
  }
  dev = {
    name  = "dev"
    email = "aws-dev@example.com"
    ou    = "workloads"
  }
  prd = {
    name  = "prd"
    email = "aws-prd@example.com"
    ou    = "workloads"
  }
}
```

Replace the example addresses with real, unique addresses before applying. Account creation can take several minutes. Account resources and the organization have Terraform `prevent_destroy` safeguards; review account lifecycle changes carefully.