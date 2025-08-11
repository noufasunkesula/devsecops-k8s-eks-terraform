

# AWS EC2 instance resource definition
resource "aws_instance" "k8s_noufa_ec2_instance" {
  ami                         = data.aws_ami.k8s_noufa_ami.image_id
  instance_type               = var.instance_type
  key_name                    = "k8s-noufa-secure-key"  
  subnet_id                   = aws_subnet.k8s_noufa_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.k8s_noufa_security_group.id]
  iam_instance_profile        = aws_iam_instance_profile.k8s_noufa_instance_profile.name

  root_block_device {
    volume_size = 30
  }

  user_data = templatefile("./scripts/tools-install.sh", {})

  tags = {
    Name = var.instance_name
  }
}

# Output: EC2 Instance ID
output "k8s_noufa_instance_id" {
  value = aws_instance.k8s_noufa_ec2_instance.id
}

# Output: EC2 Public IP
output "k8s_noufa_instance_public_ip" {
  value = aws_instance.k8s_noufa_ec2_instance.public_ip
}
