{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.slim = {
      enable = true;
      defaultUser = "jonaswouters";
    };
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
  };
}
