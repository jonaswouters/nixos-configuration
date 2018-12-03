{ config, pkgs, ... }:

{
  imports =
    [
      ../base-unstable.nix
      
      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/i3.nix
      ./trackpad.nix
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/development.nix
      
    ];
    
  # Boot settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # This value determines the NixOS release with which your
  # system is to be compatible, in order to avoid breaking
  # some software such as database servers. You should
  # change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09";
  
  # Networking
  networking = {
    hostName = "jwx1carbon";
    wireless.enable = true;
  };
}
