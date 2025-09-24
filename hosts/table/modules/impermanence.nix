{ inputs, lib, ... }:
{
  imports = [
    inputs.impermanence.nixosModules.impermanence

    ./impermanence_shadow.nix
  ];

  environment.persistence."/persistent" = {
    enable = true;
    hideMounts = true;

    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/lib/tailscale"
      "/var/db/sudo/lectured"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  boot.initrd.postResumeCommands = lib.mkAfter ''
    	  mkdir /btrfs_tmp
    	  mount /dev/nvme0n1p2 /btrfs_tmp
    	  if [[ -e /btrfs_tmp/@root ]]; then
    	      mkdir -p /btrfs_tmp/old_roots
    	      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/@root)" "+%Y-%m-%-d_%H:%M:%S")
    	      mv /btrfs_tmp/@root "/btrfs_tmp/old_roots/$timestamp"
    	  fi
    	
    	  delete_subvolume_recursively() {
    	      IFS=$'\n'
    	      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
    	          delete_subvolume_recursively "/btrfs_tmp/$i"
    	      done
    	      btrfs subvolume delete "$1"
    	  }
    	
    	  for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
    	      delete_subvolume_recursively "$i"
    	  done
    	
    	  btrfs subvolume create /btrfs_tmp/@root
    	  umount /btrfs_tmp
    	'';
}
