{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc

    wget
    cifs-utils
    git
    tmux
    appimage-run
    htop
    btop
    ranger

    zip
    unzip
    rar
    unrar

    watchman
    jujutsu
    cmake
    gnumake
    gnupg
    gdb
    uiua
    sops
    ffmpeg_7-full
    cargo

    (pkgs.callPackage ../packages/bc-with-libs/default.nix {})
  ];
}
