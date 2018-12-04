{ config, pkgs, lib, ... }:

let
  modifier = "Mod4";
  move = "50px";
  terminal = "termite";
in
{
  imports =
    [
      # Programs
      ./programs/termite.nix
    ];
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
        config = {
          modifier = "${modifier}";
        }; 
        
        keyBindings =  {
          "${modifier}+Return" = "exec ${terminal}";
        };
      };
    };
  };
}
