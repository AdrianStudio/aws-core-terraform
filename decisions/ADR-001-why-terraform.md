# ADR-001: Why Terraform over AWS CDK / CloudFormation

## Status
Accepted

## Context
Need to automate AWS infrastructure provisioning for a homelab learning project
targeting a Cloud/DevOps Engineer role in Barcelona or remote UK/USA by 2027.

## Decision
Use Terraform (HCL) instead of AWS CDK or CloudFormation.

## Reasons
- Cloud-agnostic: same tooling works for AWS, Azure, and GCP
- Industry standard: explicitly required in most Cloud/DevOps job postings
- HCL is readable, declarative, and easy to review in pull requests
- Large module ecosystem via Terraform Registry
- State management built-in with remote backend support (S3)

## Consequences
- Must manage Terraform state — solved with S3 remote backend from day one
- HCL learning curve — accepted, this is the core skill being developed
