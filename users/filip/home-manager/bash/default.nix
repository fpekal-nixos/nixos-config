{
  imports = [
    ./atuin.nix
  ];

  home-manager.users.filip = {
    home.stateVersion = "25.05";

    programs = {
      zoxide = {
        enable = true;
        enableBashIntegration = true;
        options = [
          "--cmd"
          "cd"
        ];
      };

      bash.enable = true;

      # Prompt
      bash.initExtra = ''
        . "$HOME/.profile"

        ${builtins.readFile ./PS1.sh}
      '';
    };
  };
}
