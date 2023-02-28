resource "aws_vpc" "deevpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = true

  tags = {
    Name = var.name
    Env  = var.env
  }
}

resource "aws_internet_gateway" "deeigw" {
  vpc_id = aws_vpc.deevpc.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.publicsubnet_cidr_block)
  vpc_id            = aws_vpc.deevpc.id
  cidr_block        = element(var.publicsubnet_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.name}-publicsubnet-${count.index + 1}"
  }
}

resource "aws_route_table" "mrtb" {
  vpc_id = aws_vpc.deevpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deeigw.id
  }
  tags = {
    Name = "${var.name}-Mrtb"
  }
}

resource "aws_route_table_association" "publicroute" {
  count          = length(var.publicsubnet_cidr_block)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.mrtb.id
}

# resource "aws_ecr_repository" "ecrapp" {
#   name                 = "devops"

#   image_scanning_configuration {
#     scan_on_push = true
#   }
# }