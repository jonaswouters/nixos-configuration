{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.slim = {
      enable = true;
    };
    desktopManager.xterm.enable = false;
  };
}
