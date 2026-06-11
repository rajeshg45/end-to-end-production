variable "cidr" {
    description = " The CIDR block for the VPC"
    type = string
    default = "10.0.0.0/16"
}


variable "vpc_name" {
    description = " The value for the name tag of the VPC"
    type = string
    default = "Production_vpc"
}