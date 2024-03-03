variable "instance_type" {
  type        = string
  description = "The EC2 instance type"
  default     = "t3.micro"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "subnet_id" {
  type        = string
  description = "The Subnet on which the EC2 should run"
}

variable "proxy_to_ip" {
  type        = string
  description = "The IP Address to proxy to"
}


variable "proxy_to_port" {
  type        = string
  description = "The Port to proxy to"
}
