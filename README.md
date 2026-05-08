![Terraform](https://img.shields.io/badge/Terraform-1.15-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white)
![Python](https://img.shields.io/badge/Python-3+-blue?logo=python&logoColor=white)
![boto3](https://img.shields.io/badge/boto3-AWS%20SDK-FF9900?logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI-2088FF?logo=githubactions&logoColor=white)

# aws-core-terraform

Production-grade AWS infrastructure automated with Terraform and Python boto3. Covers the AWS Core Four — VPC, EC2, S3, IAM — built as Infrastructure as Code from day one.

No clicking in the console. Define the infrastructure, run the commands, AWS handles the rest.

---

## Getting Started

Before running anything, check the [Prerequisites & Usage guide](docs/PREREQUISITES.md) for setup instructions, AWS configuration, and usage commands.

---

## Structure
aws-core-terraform/
├── terraform/
│   ├── modules/        # Reusable modules — vpc, ec2, s3, iam
│   └── envs/dev/       # Dev environment — main, variables, outputs
├── scripts/boto3/      # Python scripts to interact with deployed resources
├── docs/               # Architecture notes and prerequisites
└── decisions/          # ADRs — architectural decision records
---

## Stack

| Component | Role | Badge |
|-----------|------|-------|
| Terraform | Infrastructure as Code | ![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white) |
| AWS VPC | Isolated network with public/private subnets | ![VPC](https://img.shields.io/badge/AWS-VPC-FF9900?logo=amazonaws&logoColor=white) |
| AWS EC2 | Compute instance (t2.micro, Free Tier) | ![EC2](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonaws&logoColor=white) |
| AWS S3 | Remote state backend for Terraform | ![S3](https://img.shields.io/badge/AWS-S3-FF9900?logo=amazonaws&logoColor=white) |
| AWS IAM | Least-privilege policies for all resources | ![IAM](https://img.shields.io/badge/AWS-IAM-FF9900?logo=amazonaws&logoColor=white) |
| Python boto3 | AWS SDK — interact with deployed infrastructure | ![boto3](https://img.shields.io/badge/boto3-SDK-FF9900?logo=amazonaws&logoColor=white) |
| GitHub Actions | CI — validate, lint, security scan | ![CI](https://img.shields.io/badge/GitHub%20Actions-CI-2088FF?logo=githubactions&logoColor=white) |

---

This project is part of a homelab stack built from scratch for learning and portfolio purposes. Infrastructure is real, not simulated — everything here has been deployed, tested, and destroyed in a live AWS account.

## Author

Adrian Tamargo — [GitHub](https://github.com/AdrianStudio) · [LinkedIn](https://linkedin.com/in/adrian-daniel-tamargo-miller-35a017355)
