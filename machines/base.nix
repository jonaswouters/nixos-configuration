
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
      ../users.nix
      ../packages/common.nix
    ];
    
    # Alow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # Enable exfat for mounted drives
    boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
}
