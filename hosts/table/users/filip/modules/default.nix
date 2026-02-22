{
  imports = [
    ./home-manager
    ./minecraft.nix
    ./light.nix
    ./persistence.nix
    ./steam.nix
    ./packages.nix
    ./radiod
    ./obsidian.nix
    ./printing.nix
    ./sunshine.nix
    ./pio.nix
    ./ssh.nix
  ];

  users.users.filip = {
    extraGroups = [
      "docker"
    ];
  };
}
