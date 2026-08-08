resource "aws_instance" "web_1" {
  ami                    = data.aws_ssm_parameter.al2023_ami.value
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web_2" {
  ami                    = data.aws_ssm_parameter.al2023_ami.value
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_2.id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "web-server-2"
  }
}
