{ config, pkgs, ... }:

{
  imports =
    [
      ./base.nix
    ];
    
    # Enable exfat and ntfs for mounted drives
    # boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
    boot.supportedFilesystems = [ "ntfs" "exfat" ];

    # Timezone
    time.timeZone = "CET";
}
