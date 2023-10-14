# pets, not cattle, etc.

resource "random_pet" "bootstrap" {}

locals {
  name = random_pet.bootstrap.id
}

# HVN

## US East - Ohio

resource "hcp_hvn" "aws_east_2" {
  hvn_id         = "${local.name}-east"
  cloud_provider = "aws"
  region         = "us-east-2"
  cidr_block     = var.hvn_aws_east_cidr_block
}

## US West - Oregon

resource "hcp_hvn" "aws_west_2" {
  hvn_id         = "${local.name}-west"
  cloud_provider = "aws"
  region         = "us-west-2"
  cidr_block     = var.hvn_aws_west_cidr_block
}

# HCP Vault

# Primary

resource "hcp_vault_cluster" "aws_east" {
  cluster_id = "${local.name}-east"
  hvn_id     = hcp_hvn.aws_east_2.hvn_id
  tier       = "plus_small"

  public_endpoint = true

  metrics_config {
    grafana_endpoint = var.hcp_vault_grafana_metrics_endpoint
    grafana_user     = var.hcp_vault_grafana_metrics_user
    grafana_password = var.hcp_vault_grafana_metrics_password
  }

  audit_log_config {
    grafana_endpoint = var.hcp_vault_grafana_log_endpoint
    grafana_user     = var.hcp_vault_grafana_log_user
    grafana_password = var.hcp_vault_grafana_log_password
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "hcp_vault_cluster" "aws_west" {
  cluster_id = "${local.name}-west"
  hvn_id     = hcp_hvn.aws_west_2.hvn_id
  tier       = "plus_small"

  primary_link = hcp_vault_cluster.aws_east.self_link

  public_endpoint = true

  metrics_config {
    grafana_endpoint = var.hcp_vault_grafana_metrics_endpoint
    grafana_user     = var.hcp_vault_grafana_metrics_user
    grafana_password = var.hcp_vault_grafana_metrics_password
  }

  audit_log_config {
    grafana_endpoint = var.hcp_vault_grafana_log_endpoint
    grafana_user     = var.hcp_vault_grafana_log_user
    grafana_password = var.hcp_vault_grafana_log_password
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "hcp_vault_cluster_admin_token" "aws_east" {
  cluster_id = hcp_vault_cluster.aws_east.cluster_id
}

resource "hcp_vault_cluster_admin_token" "aws_west" {
  cluster_id = hcp_vault_cluster.aws_west.cluster_id
}
