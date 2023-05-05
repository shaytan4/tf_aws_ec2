<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.4.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.63.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.63.0 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.demogateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_lb.test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.front_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.test_tgroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route.internet_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_security_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.demosubnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.demovpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_net"></a> [admin\_net](#input\_admin\_net) | ip addr, or net for admin access SSH | `string` | `"22.11.33.44/32"` | no |
| <a name="input_aminame"></a> [aminame](#input\_aminame) | OS for installation | `map(string)` | ```{ "eu-north-1": "ami-0a6351192ce04d50c" }``` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Set aws region | `string` | `"eu-north-1"` | no |
| <a name="input_aws_sec_gr"></a> [aws\_sec\_gr](#input\_aws\_sec\_gr) | Name for security group | `string` | `"MYAPP_secgr1"` | no |
| <a name="input_aws_subnet_region"></a> [aws\_subnet\_region](#input\_aws\_subnet\_region) | Set vpc subnet region | `string` | `"eu-north-1a"` | no |
| <a name="input_inst_name"></a> [inst\_name](#input\_inst\_name) | Name for instance | `string` | `"MYAPP1"` | no |
| <a name="input_inst_type"></a> [inst\_type](#input\_inst\_type) | Set type of instance | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Desired name of AWS key pair, ssh key loaded to AWS | `string` | `"KonstHome"` | no |
| <a name="input_master_count"></a> [master\_count](#input\_master\_count) | Number of instances to deploy | `number` | `2` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Path to privat ssh key | `string` | `"~/.ssh/id_rsa"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Set subnet cidr | `string` | `"10.0.1.0/24"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Set virtual network | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_fqdn"></a> [ec2\_fqdn](#output\_ec2\_fqdn) | EC2 public fqdn |
| <a name="output_ec2_ip"></a> [ec2\_ip](#output\_ec2\_ip) | EC2 public ip addr |
| <a name="output_load_balancer"></a> [load\_balancer](#output\_load\_balancer) | Load balancer data |
<!-- END_TF_DOCS -->