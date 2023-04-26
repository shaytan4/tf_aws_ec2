# Creating VPC
resource "aws_vpc" "demovpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Demo VPC"
  }
}

# Creating Internet Gateway 
resource "aws_internet_gateway" "demogateway" {
  vpc_id = aws_vpc.demovpc.id
}

# Grant the internet access to VPC by updating its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.demovpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demogateway.id
}

# Creating 1st subnet 
resource "aws_subnet" "demosubnet1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.aws_subnet_region

  tags = {
    Name = "Demo subnet1"
  }
}

# target_type = instance (default)
# health_check  ??   https://medium.com/@sampark02/application-load-balancer-and-target-group-attachment-using-terraform-d212ce8a38a0
resource "aws_lb_target_group" "test_tgroup" {
  name     = "tf-my-lb-tgroup"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.demovpc.id
  health_check {
    interval = 5
    timeout  = 2
    path     = "/health"
    port = 80
  }
}

# attach tgroup with ec2 instances
resource "aws_lb_target_group_attachment" "test" {
  count            = length(aws_instance.web)
  target_group_arn = aws_lb_target_group.test_tgroup.arn
  #target_id        = aws_instance.web.id
  target_id = aws_instance.web[count.index].id
  port      = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "TCP"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  # alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_tgroup.arn
  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"
  #subnets            = [for subnet in aws_subnet.demosubnet1 : subnet.id]
  subnets = [aws_subnet.demosubnet1.id]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}


