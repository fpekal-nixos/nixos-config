{ pkgs, config, options, lib, ... }:
{
	options.service.minecraft-servers = {
		enable = lib.mkOption {
			description = "Enable Minecraft servers";
			default = false;
			example = true;
			type = lib.types.bool;
		};

		starting-port = lib.mkOption {
			description = "Starting port for servers. Note that 25565 will be used by gate reverse proxy.";
			default = 25566;
			example = 25566;
			type = lib.types.int;
		};

		enable-gate = lib.mkOption {
			description = "Enable gate reverse proxy";
			default = false;
			example = true;
			type = lib.types.bool;
		};

		servers = lib.mkOption {
			description = "List of servers";
			default = [];
			example = [
				{
					name = "example";
					enable = true;
					port = 25566;
					directory = "/data/minecraft/example-server";
					hostname = "example-server";
					worldname = "world";
					additional-arguments = "-Xmx1G";
					java-package = pkgs.zulu;
					jar-file = "server.jar";
				}
			];
			type = lib.types.listOf lib.types.anything;
		};

		hostname-suffix = lib.mkOption {
			description = "Hostname suffix";
			default = "";
			example = "example.com";
			type = lib.types.str;
		};

		user = lib.mkOption {
			description = "User which will run the servers";
			default = "minecraft";
			example = "minecraft";
			type = lib.types.str;
		};
	};

	config =
	let
		cfg = config.service.minecraft-servers;

		makeServerService =
		serverConfig:
		{
			enable = true;
			restartIfChanged = true;
			stopIfChanged = true;
			wantedBy = if serverConfig.enable then [ "multi-user.target" ] else [];
			serviceConfig = {
				User = "minecraft-servers";
				Group = "minecraft-servers";
			};

			script = ''
				cd ${serverConfig.directory}
				${serverConfig.java-package or pkgs.zulu}/bin/java ${serverConfig.additional-arguments or ""} ${if (serverConfig ? jar-file) then ("-jar " + serverConfig.jar-file) else ""} --port ${toString serverConfig.port} --nogui ${if (serverConfig ? worldname) then ("--world " + serverConfig.worldname) else ""}
			'';
		};

		configurePorts = (
			servers: nextPort:
			if servers == [] then []
			else (
				let
					current = builtins.head servers;
				in
				[
					(current // {
						port = current.port or nextPort;
					})
				] ++ (
					configurePorts (builtins.tail servers) (nextPort + 1)
				)
			)
		);

		configuredPorts = configurePorts cfg.servers cfg.starting-port;

	in
	lib.mkIf cfg.enable {	
		service.gate-minecraft = lib.mkIf cfg.enable-gate {
			enable = true;

			servers =
				builtins.map (
					srv: {
						host = "'" + (srv.hostname or srv.name) + cfg.hostname-suffix + "'";
						backend = "localhost:" + (toString srv.port);
					}
				) configuredPorts;
		};

		systemd.services =
		builtins.listToAttrs (builtins.map (
			n:
			{
				name = "minecraft-server-" + n.name;
				value = makeServerService n;
			}
		) configuredPorts);

		users.users.minecraft-servers = {
			isSystemUser = true;
			group = "minecraft-servers";
		};

		users.groups.minecraft-servers = {};
	};
}
