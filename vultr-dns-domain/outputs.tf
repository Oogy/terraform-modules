output "project_domain" {
  value = var.domain_exists ? data.vultr_dns_domain.domain : vultr_dns_domain.project_domain.domain
}
