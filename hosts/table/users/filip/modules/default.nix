{
  imports = [
    ./home-manager
    ./minecraft.nix
    ./light.nix
    ./persistence.nix
    ./steam.nix
    ./packages.nix
    ./zellij.nix
    ./radioboat
    ./radiod
    ./obsidian.nix
    ./printing.nix
    ./sunshine.nix
  ];

  users.users.filip = {
    extraGroups = [
      "docker"
    ];
  };
}
