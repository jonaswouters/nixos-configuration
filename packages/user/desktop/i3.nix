{ config, pkgs, lib, ... }:

let
  settings = (import ../../../private/settings.nix);
  modifier = "Mod4";
  move = "50px";
  terminal = "termite";
  secrets = (import ../../../private/secrets.nix);
in
{
  imports =
    [
      # Programs
      ./programs/common.nix
      ./programs/termite.nix
      ./programs/rofi.nix
      ./programs/polybar.nix
    ];
  home-manager.users.${secrets.username} = {
     xsession = {
      enable = true;
      
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
        config = {
          modifier = "${modifier}";
  
          startup = [
            { command = settings.desktop.xrandr-command; }
            { command = "systemctl --user restart polybar"; always = true; notification = false; }
          ];

          bars = [];

          keybindings = {
            "${modifier}+Return" = "exec ${terminal}";
            
            "${modifier}+d" = "exec rofi -show drun -show-icons -display-drun \"Launcher\"";
            "${modifier}+Shift+q" = "kill";

            "${modifier}+Left" = "focus left";
            "${modifier}+Down" = "focus down";
            "${modifier}+Up" = "focus up";
            "${modifier}+Right" = "focus right";

            "${modifier}+Shift+Left" = "move left";
            "${modifier}+Shift+Down" = "move down";
            "${modifier}+Shift+Up" = "move up";
            "${modifier}+Shift+Right" = "move right";

            "${modifier}+h" = "split h";
            "${modifier}+v" = "split v";
            "${modifier}+f" = "fullscreen toggle";

            "${modifier}+s" = "layout stacking";
            "${modifier}+w" = "layout tabbed";
            "${modifier}+e" = "layout toggle split";

            "${modifier}+Shift+space" = "floating toggle";
            "${modifier}+space" = "focus mode_toggle";

            "${modifier}+1" = "workspace 1";
            "${modifier}+2" = "workspace 2";
            "${modifier}+3" = "workspace 3";
            "${modifier}+4" = "workspace 4";
            "${modifier}+5" = "workspace 5";
            "${modifier}+6" = "workspace 6";
            "${modifier}+7" = "workspace 7";
            "${modifier}+8" = "workspace 8";
            "${modifier}+9" = "workspace 9";

            "${modifier}+Shift+1" = "move container to workspace 1";
            "${modifier}+Shift+2" = "move container to workspace 2";
            "${modifier}+Shift+3" = "move container to workspace 3";
            "${modifier}+Shift+4" = "move container to workspace 4";
            "${modifier}+Shift+5" = "move container to workspace 5";
            "${modifier}+Shift+6" = "move container to workspace 6";
            "${modifier}+Shift+7" = "move container to workspace 7";
            "${modifier}+Shift+8" = "move container to workspace 8";
            "${modifier}+Shift+9" = "move container to workspace 9";

            "${modifier}+Shift+c" = "reload";
            "${modifier}+Shift+r" = "restart";
            "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

            "${modifier}+r" = "mode resize";
          };
        }; 
      };
    };
  };
}
