![Terraform](https://img.shields.io/badge/Terraform-1.15-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white)
![Python](https://img.shields.io/badge/Python-3+-blue?logo=python&logoColor=white)
![boto3](https://img.shields.io/badge/boto3-AWS%20SDK-FF9900?logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI-2088FF?logo=githubactions&logoColor=white)

# aws-core-terraform

Production-grade AWS infrastructure automated with Terraform. Covers the AWS Core Four — VPC, EC2, S3, IAM — built as reusable modules and deployed from a single environment configuration.

No clicking in the console. Define the infrastructure, run the commands, AWS handles the rest.

---

## Architecture



---

## How it works

1. `terraform init` — downloads the AWS provider and registers all modules
2. `terraform plan` — shows exactly what will be created before touching anything
3. `terraform apply` — deploys 17 resources in AWS in under 2 minutes

Every resource is tagged with `Project`, `Environment`, and `Name` for easy identification in the AWS console.

---

## Modules

| Module | What it does |
|--------|-------------|
| `vpc` | VPC with 2 public and 2 private subnets across 2 AZs, Internet Gateway, and route table |
| `ec2` | t3.micro instance deployed in the public subnet using the latest Amazon Linux 2023 AMI |
| `s3` | Bucket with versioning enabled, AES256 encryption, and public access fully blocked |
| `iam` | IAM Role with least-privilege policy — EC2 can read S3, nothing more |

---

## Structure

```
aws-core-terraform/
├── terraform/
│   ├── modules/        # Reusable modules — vpc, ec2, s3, iam
│   └── envs/dev/       # Dev environment — main, variables, outputs, backend
├── scripts/boto3/      # Python scripts to interact with deployed resources
├── docs/               # Architecture diagram and prerequisites
└── decisions/          # ADRs — architectural decision records
```

---

## Getting Started

Before running anything, check the [Prerequisites & Usage guide](docs/PREREQUISITES.md) for setup instructions, AWS configuration, and usage commands.

---

## Stack

| Component | Role | Badge |
|-----------|------|-------|
| Terraform | Infrastructure as Code | ![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white) |
| AWS VPC | Isolated network with public/private subnets across 2 AZs | ![VPC](https://img.shields.io/badge/AWS-VPC-FF9900?logo=amazonaws&logoColor=white) |
| AWS EC2 | Compute instance — t3.micro, Amazon Linux 2023 | ![EC2](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonaws&logoColor=white) |
| AWS S3 | Object storage with versioning, encryption, and access control | ![S3](https://img.shields.io/badge/AWS-S3-FF9900?logo=amazonaws&logoColor=white) |
| AWS IAM | Least-privilege role and policy for EC2 | ![IAM](https://img.shields.io/badge/AWS-IAM-FF9900?logo=amazonaws&logoColor=white) |
| Python boto3 | AWS SDK — interact with deployed infrastructure | ![boto3](https://img.shields.io/badge/boto3-SDK-FF9900?logo=amazonaws&logoColor=white) |
| GitHub Actions | CI — terraform validate, tfsec security scan | ![CI](https://img.shields.io/badge/GitHub%20Actions-CI-2088FF?logo=githubactions&logoColor=white) |

---

> ⚠️ Remember to run `terraform destroy` after each session to avoid unnecessary AWS costs.

---

This project is part of a homelab stack built from scratch for learning and portfolio purposes. Infrastructure is real, not simulated — everything here has been deployed, tested, and destroyed in a live AWS account.

## Author

Adrian Tamargo — [GitHub](https://github.com/AdrianStudio) · [LinkedIn](https://linkedin.com/in/adrian-daniel-tamargo-miller-35a017355)
