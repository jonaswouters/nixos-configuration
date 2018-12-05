  { config, pkgs, lib, ... }:

let
  modifier = "Mod4";
  move = "50px";
  terminal = "termite";
  dpi = "150";
in
{
  imports =
    [
      # Programs
      ./programs/common.nix
      ./programs/termite.nix
      ./programs/rofi.nix
    ];
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
        config = {
          modifier = "${modifier}";
  
          startup = [
            { command = "xrandr --dpi ${dpi}"; }
          ];

          keybindings = lib.mkOptionDefault {
            "${modifier}+Return" = "exec ${terminal}";
            "${modifier}+d" = "exec rofi -show drun -show-icons -display-drun \"Launcher\"";
          };
        }; 
      };
    };
  };
}
