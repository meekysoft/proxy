variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDRs"
  default     = ["10.0.1.0/25"]
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-west-1a"]
}
