{
	services.openssh = {
		listenAddresses = [
      {
        addr = "192.168.1.59";
				port = 22;
			}
      {
        addr = "100.76.115.82";
				port = 22;
			}
		];
	};

	# Allow users to bind to ports under 1024
	boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;
}
