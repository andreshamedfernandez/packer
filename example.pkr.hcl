source "virtualbox-iso" "basic-example" {
  guest_os_type = "Ubuntu_64"
  iso_url = "CentOS-8.4.2105-x86_64-dvd1/CentOS-8.4.2105-x86_64-dvd1.iso"
  iso_checksum = "0394ecfa994db75efc1413207d2e5ac67af4f6685b3b896e2837c682221fd6b2"
  ssh_username = "root"
  ssh_password = "password"
  ssh_timeout = "30m"
  memory = "4096"
  cpus = "4"
  http_directory = "project"
  boot_command = [
                "<tab> inst.sshd inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg <enter><wait>",
		"<esc><wait>", "<enter>"
              ]
}

build {
  sources = ["sources.virtualbox-iso.basic-example"]
}
