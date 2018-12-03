{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters.home.packages = with pkgs; [
    gnupg
    keybase
  ];
}
