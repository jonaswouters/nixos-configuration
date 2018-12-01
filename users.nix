{ config, lib, pkgs, ... }:

{
  # Users
  users.users.jonaswouters = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    description = "Jonas Wouters";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wheel"
    ];
  };
}
