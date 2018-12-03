{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.awesome = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };
}
