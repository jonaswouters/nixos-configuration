{ config, pkgs, ... }:

{
  imports =
    [
      ./base-unstable.nix
    ];
    
    # Enable exfat and ntfs for mounted drives
    boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
    boot.supportedFilesystems = [ "ntfs" ];
}
