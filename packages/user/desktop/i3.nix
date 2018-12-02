{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.i3 = rec {
        enable = true;
      };
    };
  };
}
