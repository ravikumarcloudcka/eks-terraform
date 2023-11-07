resource "aws_nat_gateway" "zoominfo-nat-public1-us-west-1a" {
    subnet_id = "${aws_subnet.zoominfo-subnet-public1-us-west-1a.id}"
    tags = {
        Name = "zoominfo-nat-public1-us-west-1a"
    }
    allocation_id = "${aws_eip.zoominfo-eip-us-west-1a.id}"
}
