# Resource to create a VPC (Virtual Private Cloud)
resource "aws_vpc" "k8s_noufa_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway for the VPC
resource "aws_internet_gateway" "k8s_noufa_igw" {
  vpc_id = aws_vpc.k8s_noufa_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Public subnet within the VPC
resource "aws_subnet" "k8s_noufa_public_subnet" {
  vpc_id                  = aws_vpc.k8s_noufa_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

# Route Table for the VPC
resource "aws_route_table" "k8s_noufa_rt" {
  vpc_id = aws_vpc.k8s_noufa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s_noufa_igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

# Associate Route Table with the public subnet
resource "aws_route_table_association" "k8s_noufa_rt_association" {
  route_table_id = aws_route_table.k8s_noufa_rt.id
  subnet_id      = aws_subnet.k8s_noufa_public_subnet.id
}

# Security Group for EC2 instance access
resource "aws_security_group" "k8s_noufa_security_group" {
  vpc_id      = aws_vpc.k8s_noufa_vpc.id
  description = "Allowing Jenkins, SonarQube, SSH Access"

  ingress = [
    for port in [22, 8080, 9000, 9090, 80] : {
      description      = "Allow TCP traffic"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      ipv6_cidr_blocks = ["::/0"]
      self             = false
      prefix_list_ids  = []
      security_groups  = []
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

