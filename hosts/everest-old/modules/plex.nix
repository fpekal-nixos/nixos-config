{machineSpecific, ...}: {
  services.plex.enable = true;

  users.users."${machineSpecific.adminUser}".extraGroups = ["plex"];
}
