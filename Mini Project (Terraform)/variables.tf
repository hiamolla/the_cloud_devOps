variable "profile" {
  description = "AWS Profile to be used to configure AWS"
  type = string
  nullable = false
}

variable "subnets" {
  description = "list of subnets to create"
   type = map
   default = {
      sub-1 = {
         az = "us-east-1a"
         cidr = "172.168.1.0/24"
         name = "pub-sub-01"
      }
      sub-2 = {
         az = "us-east-1b"
         cidr = "172.168.2.0/24"
         name = "pub-sub-02"
      }
      sub-3 = {
         az = "us-east-1c"
         cidr = "172.168.3.0/24"
         name = "pub-sub-03"
      }
   }
}

variable "ubuntu-22-ami" {
  description = "AMI in use"
  type = string
  default = "ami-00874d747dde814fa"
}


variable "domain_name" {
  description = "My custom domain name"
  type = string
  default = null
}

variable "sub_domain" {
  description = "My custom sub domain name"
  type = string
  default = null
}

variable "instance_type" {
  description = "instance type to use"
  type = string
  default = "t2.micro"
}

variable "ssh_key" {
  description = "ssh key for remote connection to ec2 instance"
  type = string
  sensitive = true
}


# variable "domain_name" {
#   description = "domain name"
#   type = string
# }

# variable "sub_domain" {
#   description = "sub domain name"
#   type = string
# }