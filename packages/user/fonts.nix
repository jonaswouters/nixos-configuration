{ config, pkgs, ... }:

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

  
  home-manager.users.jonaswouters.home.packages = with pkgs; [
    # character map viewer
    gucharmap
  ];
}
