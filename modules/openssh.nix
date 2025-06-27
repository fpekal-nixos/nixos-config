{
	services.openssh = {
		enable = true;

		settings = {
			PasswordAuthentication = false;
			KbdInteractiveAuthentication = false;
			ChallengeResponseAuthentication = false;
			GatewayPorts = "clientspecified";
			X11Forwarding = true;
		};
	};
}
