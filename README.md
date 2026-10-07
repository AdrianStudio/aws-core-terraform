![Terraform](https://img.shields.io/badge/Terraform-1.15-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white)
![Python](https://img.shields.io/badge/Python-3+-blue?logo=python&logoColor=white)
![boto3](https://img.shields.io/badge/boto3-AWS%20SDK-FF9900?logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%20Passing-2088FF?logo=githubactions&logoColor=white)
![tfsec](https://img.shields.io/badge/tfsec-0%20findings-brightgreen)

# aws-core-terraform

Modular AWS infrastructure built with Terraform.

The project replaces repetitive AWS Console configuration with a simple Infrastructure as Code workflow. Infrastructure is defined in code, reviewed with Terraform and deployed with a small number of commands.

The environment covers networking, compute, storage, IAM and monitoring.

---

## Scenario

When I started working with AWS, I found myself spending too much time navigating through different menus and services just to configure a few resources.

I wanted a more consistent and repeatable workflow.

Instead of configuring infrastructure manually through the AWS Console, this project defines the environment as code and deploys it from a single Terraform environment.

---

## Architecture

<img width="1225" height="601" alt="AWS architecture diagram" src="docs/architecture.png" />

The infrastructure is deployed in `eu-west-1` and consists of:

- VPC `10.0.0.0/17`
- 2 public subnets across 2 Availability Zones
- 2 isolated private subnets
- EC2 `t3.micro`
- IAM Role and Instance Profile
- S3 bucket with versioning and KMS encryption
- VPC Flow Logs with CloudWatch
- S3 remote Terraform state

---

## Infrastructure

| Component | Purpose |
|-----------|---------|
| `vpc` | VPC, public and private subnets, Internet Gateway, routing and Flow Logs |
| `ec2` | Amazon Linux 2023 EC2 instance with encrypted root volume and IMDSv2 |
| `s3` | Versioned and encrypted S3 bucket with public access blocked |
| `iam` | IAM Role and Instance Profile providing EC2 with limited S3 access |

All resources are tagged with `Project`, `Environment` and `Name`.

---

## Security

Security controls are implemented directly in Terraform.

- IMDSv2 required on EC2
- EC2 root volume encryption
- S3 versioning
- S3 KMS encryption
- S3 public access fully blocked
- VPC Flow Logs enabled
- IAM Role instead of static AWS credentials
- Limited S3 permissions for EC2

The Terraform configuration is also scanned with `tfsec` as part of CI.

---

## Terraform Structure

```text
aws-core-terraform/
├── .github/
│   └── workflows/
│       └── ci.yml
├── decisions/
│   └── ADR-001-why-terraform.md
├── docs/
│   ├── architecture.png
│   └── PREREQUISITES.md
├── scripts/
│   └── boto3/
│       └── aws_ops.py
└── terraform/
    ├── modules/
    │   ├── vpc/
    │   ├── ec2/
    │   ├── s3/
    │   └── iam/
    └── envs/
        └── dev/
            ├── backend.tf
            ├── main.tf
            ├── outputs.tf
            └── variables.tf

Reusable modules are separated from the environment configuration.
Remote State
Terraform state is stored remotely in Amazon S3.
Bucket: adrian-terraform-state-dev
Key:    dev/terraform.tfstate
Region: eu-west-1

The backend uses S3 with encryption enabled.
boto3
The project also includes a small Python script using boto3 to interact with the deployed infrastructure.
Function	Purpose
lista_ec2()	Lists EC2 instances and their state
describir_s3()	Lists S3 buckets
subir_objeto()	Uploads a test object to S3


Run it with:
python3 scripts/boto3/aws_ops.py

CI
GitHub Actions runs on every push to main.
The pipeline performs:
Terraform Init
      ↓
Terraform Validate
      ↓
tfsec Security Scan

The current Terraform configuration passes the tfsec scan with zero findings.
Deployment
cd terraform/envs/dev

terraform init
terraform plan
terraform apply

Terraform Plan is used to review changes before deployment.
Cleanup
The infrastructure uses real AWS resources, so it should be destroyed after testing:
terraform destroy

Design Decisions
The project includes an Architecture Decision Record explaining the choice of Terraform over AWS CDK and CloudFormation.
[ADR-001: Why Terraform over AWS CDK / CloudFormation](decisions/ADR-001-why-terraform.md)
Key reasons:
- Cloud agnostic
- Declarative infrastructure
- Terraform Registry
- Industry adoption
- Remote state support
What I Learned
This project helped me move from manually configuring AWS resources through the Console to managing infrastructure through code.
Key areas:
- Terraform modules
- AWS networking
- EC2
- IAM
- S3
- Remote state
- CloudWatch
- Python and boto3
- GitHub Actions
- Terraform security scanning
- Infrastructure documentation
Stack
Technology	Role
Terraform	Infrastructure as Code
AWS VPC	Network infrastructure
AWS EC2	Compute
AWS S3	Storage and Terraform state
AWS IAM	Access control
CloudWatch	VPC Flow Logs
Python	Automation
boto3	AWS SDK
GitHub Actions	CI
tfsec	Security scanning
Excalidraw	Architecture diagram


Project Context
This project is part of a broader infrastructure and homelab learning environment.
The infrastructure was deployed, tested and destroyed in a real AWS account.
The goal was to practice a repeatable Infrastructure as Code workflow with modular Terraform, remote state, security controls, CI and documentation.
Author
Adrian Tamargo
GitHub · LinkedIn
