🔐 Secure Backend API Infrastructure (Private Network Setup)
📌 Overview

This project demonstrates a highly secure backend infrastructure deployed on AWS using Terraform, following real-world industry best practices.
The architecture ensures that backend servers and databases are not exposed to the public internet, making it suitable for finance, government, and internal enterprise applications.

🏢 Industry Use Case

Banking & Financial Applications

Government Internal Systems

Enterprise Internal APIs

Applications requiring strict network security

🧱 Architecture Summary

VPC with isolated networking

Public Subnet

Bastion Host (Jump Server)

NAT Gateway

Private Subnets

Backend EC2 Server

RDS Database (MySQL)

No direct internet access to backend and database

Secure SSH access via Bastion Host only

🖼 Architecture Diagram

🔁 Traffic Flow Explanation

Admin connects to Bastion Host using SSH (port 22)

From Bastion, admin accesses Backend EC2 in private subnet

Backend communicates with RDS internally

Backend gets outbound internet access only via NAT Gateway

Database remains completely private and inaccessible from the internet

🔐 Security Design
✔ Network Security

Backend & Database deployed in private subnets

No public IP assigned to backend or RDS

Internet access only for outbound traffic using NAT Gateway

✔ Security Groups

Bastion Host

SSH (22) → Allowed only from admin IP

Backend EC2

SSH → Allowed only from Bastion Security Group

Application Port → Internal VPC only

RDS

Database Port → Allowed only from Backend Security Group

🛠 Terraform Resources Used

aws_vpc

aws_subnet

aws_internet_gateway

aws_nat_gateway

aws_route_table

aws_security_group

aws_instance

aws_db_instance

aws_db_subnet_group
