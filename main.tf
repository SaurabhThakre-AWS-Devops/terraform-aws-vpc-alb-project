provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-0317b0f0a0144b137"
  instance_type = "t2.micro"

  tags = {
    Name = "mumbai-server"
  }

  provider = aws.ap-south-1
}

resource "aws_instance" "example2" {
  ami           = "ami-0317b0f0a0144b137"
  instance_type = "t2.micro"

  tags = {
    Name = "ireland-server"
  }

  provider = aws.eu-west-1
}

output "instance_public_ip" {
  value = [
    aws_instance.example1.public_ip,
    aws_instance.example2.public_ip
  ]
}
