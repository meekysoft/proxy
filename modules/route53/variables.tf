variable "hosted_zone_name" {
  type        = string
  description = "The Name of an existing Route53 Hosted Zone"
}

variable "a_record_name" {
  type        = string
  description = "A Name for a Route53 A Record - in essence a subdomain of the Hosted Zone"
}

variable "a_record_ip_address" {
  type        = string
  description = "An IP Address for a Route53 A Record"
}
