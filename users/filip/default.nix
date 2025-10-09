{
  imports = [
    ./authorized-keys
    ./home-manager
    ./blesh.nix
  ];

  users.users.filip = {
    isNormalUser = true;
    initialPassword = "genowefa";
    description = "Filip Pekala";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "dialout"
    ];
  };
}
