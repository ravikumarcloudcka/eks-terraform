resource "aws_route" "private" {
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.zoominfo-nat-public1-us-west-1a.id}"
    route_table_id = "${aws_route_table.zoominfo-rtb-private.id}"
}

resource "aws_route" "public" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.zoominfo-igw.id}"
    route_table_id = "${aws_route_table.zoominfo-rtb-public.id}"
}

resource "aws_route_table" "zoominfo-rtb-private" {
    vpc_id = aws_vpc.zoominfo-vpc.id
    tags = {
        Name = "zoominfo-rtb-private1-us-west-1a"
    }
}

resource "aws_route_table" "zoominfo-rtb-public" {
    vpc_id = aws_vpc.zoominfo-vpc.id
    tags = {
        Name = "zoominfo-rtb-public"
    }
}
