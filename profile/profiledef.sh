#!/usr/bin/env bash
iso_name="lilarch"
iso_label="LILARCH"
iso_publisher="LilArch"
iso_application="LilArch Live"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.systemd-boot')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/usr/local/bin/LilInstall"]="0:0:755"
  ["/usr/local/bin/lilwifi"]="0:0:755"
)
