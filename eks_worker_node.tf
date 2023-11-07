resource "aws_iam_role" "zoominfo-assignment-ng-role" {
  name = "zoominfo-assignment-ng-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.zoominfo-assignment-ng-role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.zoominfo-assignment-ng-role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.zoominfo-assignment-ng-role.name
}

resource "aws_eks_node_group" "zoominfo-node-group" {
  cluster_name    = aws_eks_cluster.zoominfo-assignment.name
  node_group_name = "zoominfo-node-group"
  node_role_arn   = aws_iam_role.zoominfo-assignment-ng-role.arn
  subnet_ids = [
            "${aws_subnet.zoominfo-subnet-private1-us-west-1a.id}",
            "${aws_subnet.zoominfo-subnet-private2-us-west-1c.id}"
        ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
