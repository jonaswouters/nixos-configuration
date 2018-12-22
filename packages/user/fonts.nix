{ config, pkgs, ... }:
let
  secrets = (import ../../private/secrets.nix);
in
{
  fonts = {
    fontconfig = {
      enable = true;
      antialias = true;
      cache32Bit = true;
      useEmbeddedBitmaps = true;
      ultimate = {
        enable = true;
        substitutions = "combi";
      };
      defaultFonts = {
        monospace = [ "Inconsolata Nerd Font" ];
      };
    };

    enableDefaultFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      nerdfonts
    ];
  };

  
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # character map viewer
    gucharmap
  ];
}
