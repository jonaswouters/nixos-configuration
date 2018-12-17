{ config, pkgs, ... }:

{
  imports =
    [
      ./base-unstable.nix
    ];
    
    # Enable exfat for mounted drives
    boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
}
