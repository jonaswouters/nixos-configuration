{ config, pkgs, ... }:
let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # browsers
    google-chrome
    
    # chat
    spotify
    discord
    slack
    
    # file manager
    ranger

    # screenshots
    shutter

    # Diff
    gnome3.meld
  ];
}
