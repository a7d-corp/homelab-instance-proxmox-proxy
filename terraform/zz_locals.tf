locals {
  vmid               = 207
  snippet_root_dir   = "/mnt/pve/cloudinit"
  snippet_file_base  = replace("${local.instance_name}-${var.instance_domain}", ".", "-")
  snippet_dir        = "snippets"
  primary_ip_gateway = cidrhost(var.net0_network_cidr, 1)
  ip_offset          = 10
  instance_name      = "proxmox-proxy"
  pm_host_address    = data.vault_generic_secret.terraform_generic.data["host"]
}
