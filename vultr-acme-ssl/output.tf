output "domain_key" {
  sensitive = true
  value     = acme_certificate.certificate.private_key_pem
}

output "domain_cert" {
  value = acme_certificate.certificate.certificate_pem
}

output "issuer_cert" {
  value = acme_certificate.certificate.issuer_pem
}

