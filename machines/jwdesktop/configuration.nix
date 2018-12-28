{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  imports =
    [
      # Drives
      ../../private/jwdesktop-drives.nix

      # Base
      ../base-workstation.nix

      # VFIO (after initial build)
      ../../vfio.nix
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/development.nix
      ../../packages/user/fonts.nix

      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/i3.nix

      # Audio
      ../../packages/audio.nix
      ../../packages/user/desktop/programs/audio.nix

      # Media
      ../../private/media.nix

      # Games
      ../../packages/user/desktop/programs/games.nix
    ];
    
  # Boot settings
  boot.loader.systemd-boot.enable = true;  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "i915" ];

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # VFIO
  services.xserver.videoDrivers = [ "modesetting" ];
  boot.kernelParams = [ "intel_iommu=on" "enable_gvt=1" "i915.enable_fbc=1" "i915.enable_guc=3" ];
  
  # This value determines the NixOS release with which your
  # system is to be compatible, in order to avoid breaking
  # some software such as database servers. You should
  # change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09";
  
  # Networking
  networking = {
    hostName = "jwdesktop";
  };

  # Update settings
  system.autoUpgrade.enable = true;

  # 3D settings
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = [ pkgs.vaapiIntel ];
    extraPackages32 = [ pkgs.vaapiIntel ];
  };
}
