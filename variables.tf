variable "vpc_cidr" {
    type = string
    default =   "10.0.0.0/16"
}
variable "enable_dns_hostnames" {
    type = bool
    default = true
}

variable "project_name" {
    type = string
     
}

variable "environment" {
    type = string
    default = "dev"
     
}

variable "common_tags" {
    type = map
}

variable "vpc_tags" {
    type = map
    default = {}
}

#IG Tagas

variable "igw_tags" {
    type = map
    default = {}
}
# public subnet

variable "public_subnet_cidrs" {
    type = list
     validation {
        condition = length(var.public_subnet_cidrs) == 2
        error_message = "please provide two valid subnet CIDR"
     }
}
variable "public_subnet_cidr_tags" {
    type = map
    default= {}
}


# private subnet
variable "private_subnet_cidrs" {
    type = list
     validation {
        condition = length(var.private_subnet_cidrs) == 2
        error_message = "please provide two valid subnet CIDR"
     }
}
variable "private_subnet_cidr_tags" {
    type = map
    default= {}
}


# Database subnet
variable "database_subnet_cidrs" {
    type = list
     validation {
        condition = length(var.database_subnet_cidrs) == 2
        error_message = "please provide two valid subnet CIDR"
     }
}
variable "database_subnet_cidr_tags" {
    type = map
    default= {}
}


# nat gatway tags
variable "nat_gateway_tags" {
    type = map
    default= {}
}


variable "public_route_table_tags" {
    type = map
    default= {}
}

variable "private_route_table_tags" {
    type = map
    default= {}
}

variable "database_route_table_tags" {
    type = map
    default= {}
}

variable "is_peering_required" {
    type = bool
    default = false
}

variable "target_vpc_id" {
    type = string
    default = ""
}
variable "vpc_peering_tags" {
    type = map
    default = {}
}
variable "db_subnet_group_tags" {
    type = map
    default = {}
}