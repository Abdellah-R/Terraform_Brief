provider "random" {
  
}

resource "random_password" "password" {
  length           = 10
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  count = 10
}

resource "local_file" "password" {
    filename = "password.txt"
    content = <<-EOT
    %{ for password in random_password.password.*.result ~}
      ${password}
    %{ endfor ~}
  EOT
}