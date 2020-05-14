provider "acme" {
  server_url = var.staging_cert ? "https://acme-staging-v02.api.letsencrypt.org/directory" : "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "domain_private_key" {
  algorithm = var.key_type
  rsa_bits  = var.rsa_bits
}

resource "tls_private_key" "account_private_key" {
  algorithm = var.key_type
  rsa_bits  = var.rsa_bits
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.account_private_key.private_key_pem
  email_address   = var.acme_reg_email
}

resource "tls_cert_request" "req" {
  key_algorithm   = var.key_type
  private_key_pem = tls_private_key.domain_private_key.private_key_pem
  dns_names       = ["*.${var.project_domain}"]

  subject {
    common_name = var.project_domain
  }
}

resource "acme_certificate" "certificate" {
  account_key_pem         = acme_registration.reg.account_key_pem
  common_name             = var.project_domain
  certificate_request_pem = tls_cert_request.req.cert_request_pem

  dns_challenge {
    provider = "vultr"
  }
}


