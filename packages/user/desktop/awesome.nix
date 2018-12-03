{ config, pkgs, ... }:

{
  services.xserver = {
    desktopManager.default = "awesome";
  };
  home-manager.users.jonaswouters = {
    xsession = {
      enable = true;
      
      windowManager.awesome = {
        enable = true;
      };
    };
  };
}
