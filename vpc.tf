resource "aws_vpc" "tf-vpc" {
  cidr_block = var.cidr-vpc
  tags = {
    name = "terraform-vpc"
  }
}