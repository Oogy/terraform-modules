module "example" {
  source = "git::https://github.com/Oogy/terraform-modules//vultr-server-app"

  region = "New Jersey"
  server_count = 1
  server_plan = "2048 MB RAM,55 GB SSD,2.00 TB BW"
  application = "Docker on Ubuntu 18.04 x64"
  module_ssh_keys = [file("~/.ssh/id_rsa.pub")]
  project_name = "example-project"
  project_component = "example-component"
}
