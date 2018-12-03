{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters = {
    services.xserver = {
      desktopManager.default = "awesome";
    };
    xsession = {
      enable = true;
      
      windowManager.awesome = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };
}
