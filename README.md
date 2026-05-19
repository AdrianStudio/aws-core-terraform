![Terraform](https://img.shields.io/badge/Terraform-1.15-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white)
![Python](https://img.shields.io/badge/Python-3+-blue?logo=python&logoColor=white)
![boto3](https://img.shields.io/badge/boto3-AWS%20SDK-FF9900?logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%20Passing-2088FF?logo=githubactions&logoColor=white)
![tfsec](https://img.shields.io/badge/tfsec-0%20findings-brightgreen)

# aws-core-terraform

Production-grade AWS infrastructure automated with Terraform. Covers the AWS Core Four — VPC, EC2, S3, IAM — built as reusable modules and deployed from a single environment configuration.

No clicking in the console. Define the infrastructure, run the commands, AWS handles the rest.

---

## Architecture

<img width="1225" height="601" alt="image" src="https://github.com/user-attachments/assets/6eb807b0-3ef2-4f94-bfa8-49ee42e3de7f" />

---

## How it works

1. `terraform init` — downloads the AWS provider and registers all modules
2. `terraform plan` — shows exactly what will be created before touching anything
3. `terraform apply` — deploys 25+ resources in AWS in under 2 minutes

Every resource is tagged with `Project`, `Environment`, and `Name` for easy identification in the AWS console.

---

## Modules

| Module | What it does |
|--------|-------------|
| `vpc` | VPC with 2 public and 2 private subnets across 2 AZs, Internet Gateway, route table, and VPC Flow Logs to CloudWatch |
| `ec2` | t3.micro instance with encrypted root volume, IMDSv2 enforced, deployed in the public subnet using the latest Amazon Linux 2023 AMI |
| `s3` | Bucket with versioning enabled, KMS encryption, public access fully blocked, and access logging |
| `iam` | IAM Role with least-privilege policy — EC2 can read S3, nothing more |

---

## boto3 Script

Python script that interacts with deployed AWS resources using the AWS SDK.

| Function | What it does |
|----------|-------------|
| `lista_ec2()` | Lists all active EC2 instances with ID and state |
| `describir_s3()` | Lists S3 buckets with name and creation date |
| `subir_objeto()` | Uploads a test object to the S3 bucket |

Run it with:

```bash
python3 scripts/boto3/aws_ops.py
```

---

## CI Pipeline

GitHub Actions pipeline triggered on every push to `main`.

| Step | What it does |
|------|-------------|
| `terraform init` | Initializes modules and providers |
| `terraform validate` | Validates configuration syntax |
| `tfsec` | Security scan — 0 findings |

---

## Structure

```
aws-core-terraform/
├── .github/workflows/  # GitHub Actions CI pipeline
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
| AWS VPC | Isolated network with public/private subnets, Flow Logs enabled | ![VPC](https://img.shields.io/badge/AWS-VPC-FF9900?logo=amazonaws&logoColor=white) |
| AWS EC2 | t3.micro, Amazon Linux 2023, encrypted disk, IMDSv2 | ![EC2](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonaws&logoColor=white) |
| AWS S3 | Versioning, KMS encryption, access logging, public access blocked | ![S3](https://img.shields.io/badge/AWS-S3-FF9900?logo=amazonaws&logoColor=white) |
| AWS IAM | Least-privilege role and policy for EC2 | ![IAM](https://img.shields.io/badge/AWS-IAM-FF9900?logo=amazonaws&logoColor=white) |
| Python boto3 | AWS SDK — list EC2, describe S3, upload objects | ![boto3](https://img.shields.io/badge/boto3-SDK-FF9900?logo=amazonaws&logoColor=white) |
| GitHub Actions | CI — terraform validate + tfsec, 0 findings | ![CI](https://img.shields.io/badge/GitHub%20Actions-CI-2088FF?logo=githubactions&logoColor=white) |

---

> ⚠️ Remember to run `terraform destroy` after each session to avoid unnecessary AWS costs.

---

This project is part of a homelab stack built from scratch for learning and portfolio purposes. Infrastructure is real, not simulated — everything here has been deployed, tested, and destroyed in a live AWS account.

## Author

Adrian Tamargo — [GitHub](https://github.com/AdrianStudio) · [LinkedIn](https://linkedin.com/in/adrian-daniel-tamargo-miller-35a017355)
