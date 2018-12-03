{ config, pkgs, lib, ... }:

let
  modifier = "Mod4";
  move = "50px";
in
{
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
        config = {
          modifier = "${modifier}";
        };
      };
    };
  };
}
