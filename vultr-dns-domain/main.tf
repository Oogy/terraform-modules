data "vultr_dns_domain" "project_domain" {
  count  = var.domain_exists ? 1 : 0
  domain = var.project_domain
}

resource "vultr_dns_domain" "project_domain" {
  count     = var.domain_exists ? 0 : 1
  domain    = var.project_domain
  server_ip = var.host
}
