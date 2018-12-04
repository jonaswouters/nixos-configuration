{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters.home.packages = with pkgs; [
    insync
    keybase
  ];
}
