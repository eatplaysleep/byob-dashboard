# TF Variables
variable "org_name" {
  type = string
}

variable "api_token" {
  type = string
}

variable "base_url" {
  type = string
}

variable "app_name" {
  type    = string
  default = "byob-dashboard"
}

variable "dac_app_name" {
  type    = string
  default = "okta-dac"
}

variable "dac_app_url" {
  type    = string
  default = "http://localhost:8080"
}

variable "app_url" {
  type    = string
  default = "http://localhost:8081"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "aws_profile" {
}

variable "aws_ssm_prefix" {
  type    = string
  default = "byob"
}

# variable "recaptcha_site_secret" {
# }
