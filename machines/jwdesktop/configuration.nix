{ config, pkgs,... }:

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

      # Yubikey
      ../../yubikey.nix

      # VFIO (after initial build)
      ../../vfio.nix
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/chat.nix
      ../../packages/user/development.nix
      ../../packages/user/fonts.nix
      ../../packages/user/fish.nix
      #../../packages/user/rescuetime.nix
      ../../packages/user/insync.nix
      ../../packages/user/desktop/programs/kitty.nix

      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/i3.nix

      # Audio
      ../../packages/audio.nix
      ../../packages/user/desktop/programs/audio.nix

      # Bluetooth 
      ../../packages/bluetooth.nix

      # Media
      ../../private/media.nix

      # Games
      ../../packages/user/desktop/programs/games.nix
    ];
    
  boot = {
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.kernelModules = [ "i915" ];

    # intel_iommu enables iommu for intel CPUs with VT-d
    # These modules are required for PCI passthrough, and must come before early modesetting stuff
    kernelParams = [ "intel_iommu=on" "enable_gvt=1" "i915.enable_fbc=1" "i915.enable_guc=3" "pci=noaer" ];
    # Prevent nvidia drivers from loading (in case you don't want fan management when vm is not running)
    blacklistedKernelModules = [ "nouveau" "nvidia" ];

    # vfio kernel modules
    kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];

    # Bind vfio-pci to nvidia card
    extraModprobeConfig ="options vfio-pci ids=10de:1b06,10de:10ef";

    # Alternative binding
    # Load the nvidia driver at startup, but make sure the vfio-pci is available for switching
    # Nvidia driver is for fan control
    postBootCommands = ''
    #  DEVS="0000:01:00.0 0000:01:00.1"
    #
    #  for DEV in $DEVS; do
    #    echo "nvidia" > /sys/bus/pci/devices/$DEV/driver_override
    #  done
    #  modprobe -i nvidia
    #  modprobe -i vfio-pci

    #  # Setup Looking Glass shared memory object
    #  touch /dev/shm/looking-glass
    #  chown jonaswouters:kvm /dev/shm/looking-glass
    #  chmod 660 /dev/shm/looking-glass
    '';
  };

  # VFIO and graphic card settings
  services.xserver.videoDrivers = [ "modesetting" ];

  # VFIO Looking-glass service
  systemd.services.sharedMem = {
    description = "shared memory for looking glass";
    wantedBy = [ "multi-user.target" ];
    script = ''
      touch /dev/shm/looking-glass
      chown ${secrets.username}:libvirtd /dev/shm/looking-glass
      chmod 660 /dev/shm/looking-glass
    '';
  };

  # 3D settings
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = [ pkgs.vaapiIntel ];
    extraPackages32 = [ pkgs.vaapiIntel ];
  };
  
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
}
