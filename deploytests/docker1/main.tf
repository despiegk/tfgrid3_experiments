 terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

variable "emailaddr" {
  type = string
}

variable "mnemonics" {
  type = string
}

variable "secret" {
  type = string
}

variable "name" {
  type = string
}

variable "nr" {
  type = string
}


variable "node" {
  type = string
}



provider "grid" {
    mnemonics = var.mnemonics
    network = "test" # or test to use testnet
}

resource "grid_network" "net1" {
    nodes = [var.node]
    ip_range = "10.${var.nr}.0.0/16"
    name = "network_${var.nr}"
    description = "network for ${var.name}"
    add_wg_access = true
}

resource "grid_deployment" "d1" {
  node = var.node
  network_name = grid_network.net1.name
  ip_range = lookup(grid_network.net1.nodes_ip_range, var.node, "")
  disks {
    name = "root"
    size = 50
    description = "root vol"
  }
  vms {
    name = "${var.name}"
    flist = "https://hub.grid.tf/kristof.3bot/threefoldtech-grid3_docker_host-3.0.flist"
    entrypoint = "/init.sh"
    mounts {
        disk_name = "root"
        mount_point = "/root"
    }       
    cpu = 8
    memory = 8000
    # rootfs_size = 10000
    env_vars = {
      SSH_KEY ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/9RNGKRjHvViunSOXhBF7EumrWvmqAAVJSrfGdLaVasgaYK6tkTRDzpZNplh3Tk1aowneXnZffygzIIZ82FWQYBo04IBWwFDOsCawjVbuAfcd9ZslYEYB3QnxV6ogQ4rvXnJ7IHgm3E3SZvt2l45WIyFn6ZKuFifK1aXhZkxHIPf31q68R2idJ764EsfqXfaf3q8H3u4G0NjfWmdPm9nwf/RJDZO+KYFLQ9wXeqRn6u/mRx+u7UD+Uo0xgjRQk1m8V+KuLAmqAosFdlAq0pBO8lEBpSebYdvRWxpM0QSdNrYQcMLVRX7IehizyTt+5sYYbp6f11WWcxLx0QDsUZ/J"
    }
    planetary = true
  }

  connection {
    type     = "ssh"
    user     = "root"
    agent    = true
    host     = grid_deployment.d1.vms[0].ygg_ip
  }

  provisioner "file" {
    source      = "../scripts"
    destination = "/tmp"
  }


  provisioner "remote-exec" {
    inline = [
      "git config --global user.email '${var.emailaddr}'",
      "bash /tmp/scripts/start_docker.sh",
      

    ]
  }
}


output "node1_zmachine1_ip" {
    value = grid_deployment.d1.vms[0].ip
}

output "ygg_ip" {
    value = grid_deployment.d1.vms[0].ygg_ip
}


