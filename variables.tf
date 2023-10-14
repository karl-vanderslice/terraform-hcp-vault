variable "hvn_aws_east_cidr_block" {
  type        = string
  default     = "172.25.16.0/20"
  description = "Subnet to use for the provisioned HashiCorp Virtual Network (HVN)."
}

variable "hvn_aws_west_cidr_block" {
  type        = string
  default     = "172.28.16.0/20"
  description = "Subnet to use for the provisioned HashiCorp Virtual Network (HVN)."
}

variable "hcp_vault_grafana_metrics_endpoint" {
  type        = string
  default     = null
  description = "Endpoint to use for Grafana Metrics."
}

variable "hcp_vault_grafana_metrics_user" {
  type        = string
  default     = null
  description = "Username to use for Grafana Metrics."
}

variable "hcp_vault_grafana_metrics_password" {
  type        = string
  default     = null
  description = "Password (API Key) to use for Grafana Metrics."
}

variable "hcp_vault_grafana_log_endpoint" {
  type        = string
  default     = null
  description = "Endpoint to use for Grafana Logs."
}

variable "hcp_vault_grafana_log_user" {
  type        = string
  default     = null
  description = "Username to use for Grafana Logs."
}

variable "hcp_vault_grafana_log_password" {
  type        = string
  default     = null
  description = "Password to use for Grafana Logs."
}
