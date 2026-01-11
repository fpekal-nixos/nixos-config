{
  environment.persistence."/persistent" = {
    users.filip = {
      directories = [
        ".local/share/Steam"
      ];
    };
  };

  environment.persistence."/mnt/hdd/persistent" = {
    users.filip = {
      directories = [
        ".local/share/Euro Truck Simulator 2"
      ];
    };
  };

  # fileSystems."/persistent/home/filip/.local/share/Euro Truck Simulator 2/mod" = {
  # 	depends = [
  # 		"/mnt/hdd"
  # 		"/persistent"
  # 	];

  # 	device = "/mnt/hdd/Games/ETS-mods";
  # 	fsType = "none";
  # 	options = [
  # 		"bind"
  # 		"uid=1000"
  # 	];
  # };
}
