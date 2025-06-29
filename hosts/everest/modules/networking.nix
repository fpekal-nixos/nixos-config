{
  # Enable networking
  networking.networkmanager.enable = true;
  networking.defaultGateway = {
    address = "192.168.1.1";
    interface = "eno1";
  };
  networking.nameservers = [ "192.168.1.1" "8.8.8.8" ];
  networking.interfaces.eno1.ipv4.addresses = [
    {
      address = "192.168.1.59";
      prefixLength = 24;
    }
  ];

	networking.networkmanager.unmanaged = [ "interface-name:ve-*" ];
	networking.nat = {
		enable = true;
		internalInterfaces = ["ve-+"];
		externalInterface = "eno1";
	};

	# Allow all users to bind to all ports
	boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;

  networking.firewall.enable = false;
}
