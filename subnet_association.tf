resource "aws_route_table_association" "zoominfo-rtb-private1-us-west-1a" {
    route_table_id = "${aws_route_table.zoominfo-rtb-private.id}"
    subnet_id = "${aws_subnet.zoominfo-subnet-private1-us-west-1a.id}"
}

resource "aws_route_table_association" "zoominfo-rtb-public1-us-west-1a" {
    route_table_id = "${aws_route_table.zoominfo-rtb-public.id}"
    subnet_id = "${aws_subnet.zoominfo-subnet-public1-us-west-1a.id}"
}
resource "aws_route_table_association" "zoominfo-rtb-public2-us-west-1c" {
    route_table_id = "${aws_route_table.zoominfo-rtb-public.id}"
    subnet_id = "${aws_subnet.zoominfo-subnet-public2-us-west-1c.id}"
}
resource "aws_route_table_association" "zoominfo-rtb-private2-us-west-1c" {
    route_table_id = "${aws_route_table.zoominfo-rtb-private.id}"
    subnet_id = "${aws_subnet.zoominfo-subnet-private2-us-west-1c.id}"
}
