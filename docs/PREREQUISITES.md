# Prerequisites & Usage

## Requirements

- Terraform 1.15+
- AWS CLI 2.x configured with IAM user `terraform-dev`
- Python 3+ with boto3
- AWS account (Free Tier compatible)
- Git

## AWS Setup

Create an IAM user `terraform-dev` with the following policies:
- `AmazonEC2FullAccess`
- `AmazonS3FullAccess`
- `AmazonVPCFullAccess`
- `IAMFullAccess`

Configure AWS CLI:

```bash
aws configure
```

Verify access:

```bash
aws sts get-caller-identity
```

## Terraform Usage

```bash
cd terraform/envs/dev
terraform init
terraform plan
terraform apply
```

Destroy all resources when done:

```bash
terraform destroy
```

## Python boto3 Usage

```bash
cd scripts/boto3
pip install boto3
python3 <script>.py
```
