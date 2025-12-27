output "vpc-name" {
  value = aws_vpc.tf-vpc.arn
}

output "public-ip" {
  value = aws_instance.bastion-instance.public_ip
}

