{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters.home.packages = with pkgs; [
    # fonts
    crimson
    inconsolata
    mononoki
    opensans-ttf
    powerline-fonts
    roboto
    source-code-pro
    corefonts
    terminus_font
    ubuntu_font_family
    nerdfonts

    # character map viewer
    gucharmap
  ];
}
