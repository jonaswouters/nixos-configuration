{ config, pkgs, ... }:
let
  secrets = (import ../../../private/secrets.nix);
in
{
    imports =
    [
      # Programs
      ./programs/common.nix
      ./programs/termite.nix
      ./programs/rofi.nix
    ];
  home-manager.users.${secrets.username} = {
    xsession = {
      enable = true;
      
      windowManager.awesome = {
        enable = true;
      };
    };
  };
}
