resource "aws_subnet" "zoominfo-subnet-private1-us-west-1a" {
    availability_zone = "us-west-1a"
    cidr_block = "10.0.128.0/20"
    vpc_id = aws_vpc.zoominfo-vpc.id
    map_public_ip_on_launch = false
}

resource "aws_subnet" "zoominfo-subnet-public2-us-west-1c" {
    availability_zone = "us-west-1c"
    cidr_block = "10.0.16.0/20"
    vpc_id = aws_vpc.zoominfo-vpc.id
    map_public_ip_on_launch = false
}

resource "aws_subnet" "zoominfo-subnet-public1-us-west-1a" {
    availability_zone = "us-west-1a"
    cidr_block = "10.0.0.0/20"
    vpc_id = aws_vpc.zoominfo-vpc.id
    map_public_ip_on_launch = false
}

resource "aws_subnet" "zoominfo-subnet-private2-us-west-1c" {
    availability_zone = "us-west-1c"
    cidr_block = "10.0.144.0/20"
    vpc_id = aws_vpc.zoominfo-vpc.id
    map_public_ip_on_launch = false
}
