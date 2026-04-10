#main.tf

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "my_infra_configure" {
  name        = var.security_group_name
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      =  data.aws_vpc.default.id

  # Inbound HTTP rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  # Inbound SSH rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    description = "Allow SSH from anywhere"
  }

  # Outbound rule: Allow all traffic
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


resource "aws_instance" "ec2_name"{
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = var.cpu_config

 vpc_security_group_ids = [
    aws_security_group.my_infra_configure.id
  ]
 
 tags = {
    Name = var.ec2_name
  }
}



resource "aws_s3_bucket" "abhinand" {
  bucket = var.my_bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
