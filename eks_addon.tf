data "aws_eks_addon_version" "cni-latest" {
  addon_name         = "vpc-cni"
  kubernetes_version = aws_eks_cluster.zoominfo-assignment.version
  most_recent        = true
}
data "aws_eks_addon_version" "codedns-latest" {
  addon_name         = "coredns"
  kubernetes_version = aws_eks_cluster.zoominfo-assignment.version
  most_recent        = true
}
data "aws_eks_addon_version" "kube-proxy-latest" {
  addon_name         = "kube-proxy"
  kubernetes_version = aws_eks_cluster.zoominfo-assignment.version
  most_recent        = true
}
resource "aws_eks_addon" "vpc-cni" {
  cluster_name                = aws_eks_cluster.zoominfo-assignment.name
  addon_name                  = "vpc-cni"
  addon_version               = data.aws_eks_addon_version.cni-latest.version
  resolve_conflicts_on_create = "OVERWRITE"
}
resource "aws_eks_addon" "coredns" {
  cluster_name                = aws_eks_cluster.zoominfo-assignment.name
  addon_name                  = "coredns"
  addon_version               = data.aws_eks_addon_version.codedns-latest.version
  resolve_conflicts_on_create = "OVERWRITE"
}
resource "aws_eks_addon" "kube-proxy" {
  cluster_name                = aws_eks_cluster.zoominfo-assignment.name
  addon_name                  = "kube-proxy"
  addon_version               = data.aws_eks_addon_version.kube-proxy-latest.version                                                           
  resolve_conflicts_on_create = "OVERWRITE"
}
