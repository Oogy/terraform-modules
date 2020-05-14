output "project_domain" {
  value = var.domain_exists ? data.vultr_dns_domain[0].domain : vultr_dns_domain.project_domain[0].domain
}
