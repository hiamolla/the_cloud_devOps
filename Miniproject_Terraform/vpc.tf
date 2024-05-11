resource "aws_vpc" "my_vpc" {
  cidr_block       = "172.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}


# resource "aws_subnet" "main-subnets" {
#   for_each = var.subnets
 
#   availability_zone_id = each.value["az"]
#   cidr_block = each.value["cidr"]
#   vpc_id     = aws_vpc.my_vpc.id

#   tags = {
#     Name = "${each.value["name"]}"
#   }
# }

resource "aws_subnet" "subnets" {
  count = length(var.subnets)

  vpc_id = aws_vpc.my_vpc.id
  cidr_block = values(var.subnets)[count.index].cidr
  availability_zone = values(var.subnets)[count.index].az
  tags = {
    Name = values(var.subnets)[count.index].name
  }
}


resource "aws_internet_gateway" "my_vpc_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_vpc_gateway"
  }
}

resource "aws_route" "route_table_gw_rule" {
  route_table_id          = aws_vpc.my_vpc.default_route_table_id
  destination_cidr_block   = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.my_vpc_gateway.id
}

resource "aws_route_table_association" "rt_association_to_subnets" {
  count = length(aws_subnet.subnets)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_vpc.my_vpc.default_route_table_id
}


resource "aws_security_group" "server_sg" {
  name        = "server_sg"
  description = "for traffic into instances"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "TCP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
  }

    ingress {
    description      = "SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "server_sg"
  }
}

