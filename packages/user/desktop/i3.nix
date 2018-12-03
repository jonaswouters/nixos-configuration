{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };
}
