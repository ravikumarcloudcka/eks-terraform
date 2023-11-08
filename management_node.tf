resource "aws_instance" "eks-management-node" {
    ami = "ami-010f8b02680f80998"
    instance_type = "t3.medium"
    availability_zone = "us-west-1a"
    associate_public_ip_address = true
    key_name = "management_node"
    tenancy = "default"
    subnet_id = aws_subnet.zoominfo-subnet-public1-us-west-1a.id
    ebs_optimized = false
    vpc_security_group_ids = [
        "${aws_security_group.management-node-sg.id}"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "eks-management-node"
    }
}

resource "aws_security_group" "management-node-sg" {
    description = "management-node-sg"
    name = "management-node-sg"
    tags = {}
    vpc_id = aws_vpc.zoominfo-vpc.id
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        description = "management-node-ssh"
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        description = "Jenkins"
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_iam_role" "Managementrole" {
    path = "/"
    name = "Managementrole"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
    tags = {}
}
