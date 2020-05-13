output "server_ip" {
  value = vultr_server.server.*.main_ip
}

output "server_id" {
  value = vultr_server.server.*.id
}
