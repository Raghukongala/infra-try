output "organization_id" {
  description = "AWS Organizations ID."
  value       = aws_organizations_organization.this.id
}

output "root_id" {
  description = "Organization root ID."
  value       = aws_organizations_organization.this.roots[0].id
}

output "organizational_unit_ids" {
  description = "IDs of the created organizational units."
  value       = { for key, unit in aws_organizations_organizational_unit.this : key => unit.id }
}

output "account_ids" {
  description = "IDs of the member accounts created by this configuration."
  value       = { for key, account in aws_organizations_account.this : key => account.id }
}

output "cloudtrail_bucket_name" {
  description = "S3 bucket receiving organization CloudTrail logs."
  value       = aws_s3_bucket.cloudtrail.id
}

output "cloudtrail_arn" {
  description = "Organization-wide multi-region CloudTrail trail ARN."
  value       = aws_cloudtrail.organization.arn
}