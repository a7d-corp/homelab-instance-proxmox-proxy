pm_host_port    = 8006
pm_tls_insecure = true

instance_description = "proxmox UI/API reverse proxy"
instance_domain      = "node.room101.a7d"

clone         = "template-ubuntu-2404"
target_node   = "host-01"
resource_pool = "infrastructure"

os_type                 = "cloud-init"
cloudinit_cdrom_storage = "nfs-cloudinit"
citemplate_storage      = "nfs-cloudinit"

resource_cpu_cores   = 1
resource_cpu_sockets = 1
resource_memory      = 512
scsihw               = "virtio-scsi-pci"

# network config
network_model = "virtio"

# cloudinit network config
search_domains = ["node.room101.a7d", "analbeard.com", "a7d.dev"]
dns_servers    = ["10.101.0.2", "10.101.0.3"]

# primary nic config
net0_network_bridge  = "vmbr0"
net0_vlan_tag        = 1001
net0_network_cidr    = "172.25.0.0/23"
net0_network_netmask = 23

disks = [
  {
    discard    = true
    emulatessd = true
    size       = "10G"
    slot       = "virtio0"
    storage    = "local-lvm"
    type       = "disk"
  },
  {
    slot    = "ide0"
    storage = "nfs-cloudinit"
    type    = "cloudinit"
  }
]
