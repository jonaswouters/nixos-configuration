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
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/development.nix
      ../../packages/user/fonts.nix

      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/i3.nix

      # Media
      ../../private/media.nix
    ];
    
  # Boot settings
  boot.loader.systemd-boot.enable = true;  
  
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
}
