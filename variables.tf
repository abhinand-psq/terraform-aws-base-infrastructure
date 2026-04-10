#variables.tf

variable "cpu_config" {
  type    = string
  default = "t3.micro"
}

variable "ec2_name" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "my_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "security_group_name" {
  type        = string
  description = "Name of the S3 bucket"
}

