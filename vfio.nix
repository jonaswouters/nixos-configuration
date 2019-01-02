{config, pkgs, ... }:
let
  secrets = (import ./private/secrets.nix);
in
{  
  ## PUT THIS IN YOUR MACHINE CONFIG
  #boot = {
  #  # Use latest kernel
  #  kernelPackages = pkgs.linuxPackages_latest;
  #  loader = {
  #    # Use the systemd-boot EFI boot loader.
  #    systemd-boot.enable = true;
  #    efi.canTouchEfiVariables = true;
  #  };
  #
  #  initrd.kernelModules = [ "i915" ];
  #
  #  # intel_iommu enables iommu for intel CPUs with VT-d
  #  # CHANGE: intel_iommu enables iommu for intel CPUs with VT-d
  #  # use amd_iommu if you have an AMD CPU with AMD-Vi
  #  # These modules are required for PCI passthrough, and must come before early modesetting stuff
  #  kernelParams = [ "intel_iommu=on" "enable_gvt=1" "i915.enable_fbc=1" "i915.enable_guc=3" "pci=noaer" ];
  #  # Prevent nvidia drivers from loading (in case you don't want fan management when vm is not running)
  #  blacklistedKernelModules = [ "nouveau" "nvidia" ];
  #
  #  # vfio kernel modules
  #  kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
  #
  #  # Bind vfio-pci to nvidia card ## CHANGE: Don't forget to put your own PCI IDs here
  #  extraModprobeConfig ="options vfio-pci ids=10de:1b06,10de:10ef";
  #
  #  # Alternative binding
  #  # Load the nvidia driver at startup, but make sure the vfio-pci is available for switching
  #  # Nvidia driver is for fan control
  #  #postBootCommands = ''
  #  #  DEVS="0000:01:00.0 0000:01:00.1"
  #  #
  #  #  for DEV in $DEVS; do
  #  #    echo "nvidia" > /sys/bus/pci/devices/$DEV/driver_override
  #  #  done
  #  #  modprobe -i nvidia
  #  #  modprobe -i vfio-pci
  #  #'';
  #};
  
  environment.systemPackages = with pkgs; [
    virtmanager
    qemu
    OVMF
  ];
  
  # Enable virtualisation
  virtualisation = {
    libvirtd = {
      enable = true;
      qemuOvmf = true;
    };
  };
  
  # libvrtd members
  users.groups.libvirtd.members = [ "root" "${secrets.username}"];
  
  # CHANGE: use 
  #     ls /nix/store/*OVMF*/FV/OVMF{,_VARS}.fd | tail -n2 | tr '\n' : | sed -e 's/:$//'
  # to find your nix store paths
  virtualisation.libvirtd.qemuVerbatimConfig = ''
    nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
  '';

}