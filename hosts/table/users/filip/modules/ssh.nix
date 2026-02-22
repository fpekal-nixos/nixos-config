{
  sops.secrets."ssh/table/private" = {
    path = "/home/filip/.ssh/id_ed25519";
    owner = "filip";
  };
  sops.secrets."ssh/table/public" = {
    path = "/home/filip/.ssh/id_ed25519.pub";
    owner = "filip";
  };
}
