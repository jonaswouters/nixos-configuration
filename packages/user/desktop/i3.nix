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

          keybindings = {
            "${modifier}+Return" = "exec ${terminal}";
            
            "${modifier}+d" = "exec rofi -show drun -show-icons -display-drun \"Launcher\"";
            "${cfg.config.modifier}+Shift+q" = "kill";

            "${cfg.config.modifier}+Left" = "focus left";
            "${cfg.config.modifier}+Down" = "focus down";
            "${cfg.config.modifier}+Up" = "focus up";
            "${cfg.config.modifier}+Right" = "focus right";

            "${cfg.config.modifier}+Shift+Left" = "move left";
            "${cfg.config.modifier}+Shift+Down" = "move down";
            "${cfg.config.modifier}+Shift+Up" = "move up";
            "${cfg.config.modifier}+Shift+Right" = "move right";

            "${cfg.config.modifier}+h" = "split h";
            "${cfg.config.modifier}+v" = "split v";
            "${cfg.config.modifier}+f" = "fullscreen toggle";

            "${cfg.config.modifier}+s" = "layout stacking";
            "${cfg.config.modifier}+w" = "layout tabbed";
            "${cfg.config.modifier}+e" = "layout toggle split";

            "${cfg.config.modifier}+Shift+space" = "floating toggle";
            "${cfg.config.modifier}+space" = "focus mode_toggle";

            "${cfg.config.modifier}+1" = "workspace 1";
            "${cfg.config.modifier}+2" = "workspace 2";
            "${cfg.config.modifier}+3" = "workspace 3";
            "${cfg.config.modifier}+4" = "workspace 4";
            "${cfg.config.modifier}+5" = "workspace 5";
            "${cfg.config.modifier}+6" = "workspace 6";
            "${cfg.config.modifier}+7" = "workspace 7";
            "${cfg.config.modifier}+8" = "workspace 8";
            "${cfg.config.modifier}+9" = "workspace 9";

            "${cfg.config.modifier}+Shift+1" = "move container to workspace 1";
            "${cfg.config.modifier}+Shift+2" = "move container to workspace 2";
            "${cfg.config.modifier}+Shift+3" = "move container to workspace 3";
            "${cfg.config.modifier}+Shift+4" = "move container to workspace 4";
            "${cfg.config.modifier}+Shift+5" = "move container to workspace 5";
            "${cfg.config.modifier}+Shift+6" = "move container to workspace 6";
            "${cfg.config.modifier}+Shift+7" = "move container to workspace 7";
            "${cfg.config.modifier}+Shift+8" = "move container to workspace 8";
            "${cfg.config.modifier}+Shift+9" = "move container to workspace 9";

            "${cfg.config.modifier}+Shift+c" = "reload";
            "${cfg.config.modifier}+Shift+r" = "restart";
            "${cfg.config.modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

            "${cfg.config.modifier}+r" = "mode resize";
          };
        }; 
      };
    };
  };
}
