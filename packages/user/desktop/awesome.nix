{ config, pkgs, ... }:
let
  secrets = (import ../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username} = {
    xsession = {
      enable = true;
      
      windowManager.awesome = {
        enable = true;
      };
    };
  };
}
