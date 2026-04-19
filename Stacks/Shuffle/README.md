# Shuffle Stack

This Terraform stack deploys a single private EC2 instance for Shuffle using a prebuilt golden AMI and an existing security group.

## What it creates

- 1 EC2 instance for Shuffle

## What it uses

- 1 existing security group for the Shuffle instance
- 1 existing IAM instance profile, typically for SSM access
- 1 existing private subnet
- 1 existing AMI

## What it does not create

- No Route 53 records
- No load balancer
- No SSH access
- No user data bootstrap
- No private DNS
- No EIP or public IP by default
- No security group or security group rules

## Required inputs

At minimum, provide values for:

- `aws_region`
- `environment`
- `vpc_id`
- `subnet_id`
- `ami_id`
- `instance_profile_name`
- `shuffle_security_group_id`

You will usually also want:

- `instance_type`
- `root_volume_size`

## Example usage

From `stacks/shuffle`:

```bash
terraform init
terraform validate
terraform plan -var-file=../../environments/dev/shuffle.auto.tfvars
terraform apply -var-file=../../environments/dev/shuffle.auto.tfvars