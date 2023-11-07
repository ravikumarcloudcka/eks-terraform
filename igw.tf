resource "aws_internet_gateway" "zoominfo-igw" {
    tags = {
        Name = "zoominfo-igw"
    }
    vpc_id = "${aws_vpc.zoominfo-vpc.id}"
}
