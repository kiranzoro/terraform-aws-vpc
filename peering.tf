resource "aws_vpc_peering_connection" "peering" {
count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = var.target_vpc_id == "" ? data.aws_vpc.default.id : var.target_vpc_id.id
  vpc_id        = aws_vpc.main.id
  auto_accept = var.target_vpc_id == "" ? true : false


  tags = merge(var.common_tags, var.vpc_peering_tags, {
    Name = "${local.resource_name}"
  })
}

resource "aws_route" "public_route_peering" {
  count = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}


resource "aws_route" "private_route_peering" {
  count = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}


resource "aws_route" "database_route_peering" {
  count = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id

}

resource "aws_route" "default_route_peering" {
  count = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_route_table.main.id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id

}