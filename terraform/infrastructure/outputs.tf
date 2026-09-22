output "aws_region" {
  description = "AWS Region containing the project infrastructure."
  value       = var.aws_region
}

output "vpc_id" {
  description = "ID of the project VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet."
  value       = aws_subnet.private.id
}

output "eks_cluster_name" {
  description = "Name of the Amazon EKS cluster."
  value       = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  description = "Kubernetes API endpoint of the Amazon EKS cluster."
  value       = aws_eks_cluster.main.endpoint
}

output "eks_cluster_version" {
  description = "Kubernetes version used by the Amazon EKS cluster."
  value       = aws_eks_cluster.main.version
}

output "eks_cluster_security_group_id" {
  description = "Security group created by EKS for the cluster."
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "eks_oidc_issuer" {
  description = "OpenID Connect issuer URL of the EKS cluster."
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "ecr_repository_name" {
  description = "Name of the ECR repository."
  value       = aws_ecr_repository.application.name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository."
  value       = aws_ecr_repository.application.repository_url
}

output "eks_cluster_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane."
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "ARN of the IAM role used by the EKS worker nodes."
  value       = aws_iam_role.eks_nodes.arn
}

output "public_node_group_name" {
  description = "Name of the managed node group in the public subnet."
  value       = aws_eks_node_group.public.node_group_name
}

output "private_node_group_name" {
  description = "Name of the managed node group in the private subnet."
  value       = aws_eks_node_group.private.node_group_name
}

output "nat_gateway_public_ip" {
  description = "Public Elastic IP address assigned to the NAT Gateway."
  value       = aws_eip.nat.public_ip
}

output "configure_kubectl_command" {
  description = "Command used to configure kubectl for this EKS cluster."
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${aws_eks_cluster.main.name} --profile eks-lab"
}