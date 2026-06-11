variable "environment"        { type = string }
variable "single_nat_gateway" { type = bool }
variable "server_port"        { type = number }

# Primary Sizing
variable "primary_region"         { type = string }
variable "primary_vpc_cidr"       { type = string }
variable "primary_public_1_cidr"  { type = string }
variable "primary_public_2_cidr"  { type = string }
variable "primary_private_1_cidr" { type = string }
variable "primary_private_2_cidr" { type = string }
variable "primary_instance_type"  { type = string }
variable "primary_ami_id"         { type = string }

# Secondary Sizing
variable "secondary_region"         { type = string }
variable "secondary_vpc_cidr"       { type = string }
variable "secondary_public_1_cidr"  { type = string }
variable "secondary_public_2_cidr"  { type = string }
variable "secondary_private_1_cidr" { type = string }
variable "secondary_private_2_cidr" { type = string }
variable "secondary_instance_type"  { type = string }
variable "secondary_ami_id"         { type = string }