{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../base-unstable.nix
      ../hardware-configuration.nix
    ];
    
    # Enable exfat for mounted drives
    boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
}
