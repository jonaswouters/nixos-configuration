{ config, pkgs, ... }:
let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # browsers
    google-chrome
    firefox
    
    # chat
    spotify
    #discord
    slack
    
    # file managers
    ranger # shell
    gnome3.nautilus # gui

    # viewers
    zathura # PDF
    feh # image viewer

    # screenshots
    shutter

    # Diff
    gnome3.meld
  ];
}
