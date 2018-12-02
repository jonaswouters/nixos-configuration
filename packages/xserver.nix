{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      enable = true;
    };
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
  };
}
