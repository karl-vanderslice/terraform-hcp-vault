output "aws_east_vault_bootstrap_admin_token" {
  value       = hcp_vault_cluster_admin_token.aws_east.token
  sensitive   = true
  description = "Admin token for the AWS East Bootstrap Cluster."
}

output "aws_east_vault_bootstrap_public_endpoint_url" {
  value       = hcp_vault_cluster.aws_east.vault_public_endpoint_url
  sensitive   = true
  description = "Public URL for the AWS East Bootstrap Cluster."
}

output "aws_west_vault_bootstrap_admin_token" {
  value       = hcp_vault_cluster_admin_token.aws_west.token
  sensitive   = true
  description = "Admin token for the AWS West Bootstrap Cluster."
}

output "aws_west_vault_bootstrap_public_endpoint_url" {
  value       = hcp_vault_cluster.aws_west.vault_public_endpoint_url
  sensitive   = true
  description = "Public URL for the AWS West Bootstrap Cluster."
}
