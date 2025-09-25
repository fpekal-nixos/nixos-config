{impurity, ...}: {
  imports = [./neovide.nix];

  home-manager.users.filip = {
    home.file.".config/nvim" = {
      source = impurity.link ./nvim-config;
      recursive = true;
    };
  };

  sops.secrets."neovim/codecompanion-key" = {
    path = "/home/filip/.secrets/nvim-codecompanion.key";
    owner = "filip";
  };
}
