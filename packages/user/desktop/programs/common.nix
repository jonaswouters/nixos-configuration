{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters.home.packages = with pkgs; [
    google-chrome
    spotify
    discord
    slack
  ];
}
