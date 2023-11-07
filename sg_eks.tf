resource "aws_security_group" "eks-cluster-sg-zoominfo-assignment" {
    description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
    name = "eks-cluster-sg-zoominfo-assignment"
    tags = {
        Name = "eks-cluster-sg-zoominfo-assignment"
    }
    vpc_id = aws_vpc.zoominfo-vpc.id
    ingress {
        from_port = 0
        protocol = "-1"
        to_port = 0
	self = true
    }
    ingress {
        security_groups = [
            aws_security_group.management-node-sg.id
        ]
        from_port = 0
        protocol = "tcp"
        to_port = 0
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
