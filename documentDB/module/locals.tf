locals {
  identifier      = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : "${var.identifier}"
  master_password = var.master_password == null ? random_password.password.result : var.master_password
}
