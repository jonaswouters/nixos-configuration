{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      desktopManager.default = "i3";
      
      windowManager.i3 = rec {
        enable = true;
      };
    };
  };
}
