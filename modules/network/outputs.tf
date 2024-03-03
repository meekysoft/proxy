output "vpc" {
  value = aws_vpc.vpc
}

output "public_subnets" {
  value = aws_subnet.public_subnets
}