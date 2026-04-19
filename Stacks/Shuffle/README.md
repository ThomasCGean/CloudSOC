# Shuffle Stack

This Terraform stack deploys a single private EC2 instance for Shuffle using a prebuilt golden AMI.

## What it creates

- 1 EC2 instance for Shuffle
- 1 security group for the Shuffle instance
- 1 or more SG-to-SG ingress rules based on allowed source security groups
- allow-all outbound egress rules

## What it does not create

- No Route 53 records
- No load balancer
- No SSH access
- No user data bootstrap
- No private DNS
- No EIP or public IP by default

## Required inputs

At minimum, provide values for:

- `aws_region`
- `environment`
- `vpc_id`
- `subnet_id`
- `ami_id`
- `instance_profile_name`

You will usually also want:

- `shuffle_allowed_source_sg_ids`
- `instance_type`
- `root_volume_size`

## Example usage

From `stacks/shuffle`:

```bash
terraform init
terraform validate
terraform plan -var-file=../../environments/dev/shuffle.auto.tfvars
terraform apply -var-file=../../environments/dev/shuffle.auto.tfvars