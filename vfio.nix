{config, pkgs, ... }:
let
  secrets = (import ./private/secrets.nix);
in
{  
  # CHANGE: intel_iommu enables iommu for intel CPUs with VT-d
  # use amd_iommu if you have an AMD CPU with AMD-Vi
  # boot.kernelParams = [ "intel_iommu=on" ];
  # Put this in your machine config first before adding this file.
    
  # These modules are required for PCI passthrough, and must come before early modesetting stuff
  boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];

  # Prevent nvidia drivers from loading
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" ];
  
  # CHANGE: Don't forget to put your own PCI IDs here
  # boot.extraModprobeConfig ="options vfio-pci ids=10de:1b06,10de:10ef";
  # Add this to the machine configuration
  
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