# output "azs" {
#     value = data.aws_availability_zones.zones.names

output "vpc_id" {
    value = aws_vpc.main.id
}