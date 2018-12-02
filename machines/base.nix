
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
      ../users.nix
    ];
    
    boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
}
