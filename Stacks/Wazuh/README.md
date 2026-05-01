# Wazuh Terraform Stack

This stack launches a private EC2 instance for Wazuh from a prebuilt golden AMI.

## Design notes

- AMI-based deployment
- Existing VPC/subnet
- Existing security group attached by ID
- Existing IAM instance profile attached by name
- No public IP
- Intended management path is AWS Systems Manager (SSM)
- Static private IP is set to 10.0.11.121 by default

## Files

- `main.tf` - EC2 instance resource and tags
- `variables.tf` - input variables
- `outputs.tf` - useful outputs
- `providers.tf` - Terraform and AWS provider config

## Usage

From `stacks/wazuh`:

```bash
terraform init
terraform validate
terraform plan  -var-file="../../environments/dev/wazuh.auto.tfvars"
terraform apply -var-file="../../environments/dev/wazuh.auto.tfvars"