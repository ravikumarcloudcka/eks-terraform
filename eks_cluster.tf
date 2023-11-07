resource "aws_eks_cluster" "zoominfo-assignment" {
    name = "zoominfo-assignment"
    role_arn = aws_iam_role.eksClusterRole.arn
    version = "1.28"
    vpc_config {
        subnet_ids = [
            "${aws_subnet.zoominfo-subnet-private1-us-west-1a.id}",
            "${aws_subnet.zoominfo-subnet-private2-us-west-1c.id}"
        ]
        endpoint_private_access = true
        endpoint_public_access = false
    }
    depends_on = [
    	aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    ]
}
