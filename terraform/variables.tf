variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "streamline"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "Your public IP/CIDR, e.g., 203.0.113.10/32"
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name in us-east-1"
  type        = string
}

variable "web_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "db_username" {
  type    = string
  default = "streamline_user"
}

variable "db_password" {
  description = "RDS password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  type    = string
  default = "streamlinedb"
}

variable "db_engine_version" {
  type    = string
  default = "8.0"
}
