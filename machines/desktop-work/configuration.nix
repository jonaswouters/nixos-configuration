{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  imports =
    [
      # Base
      ../base-workstation.nix
      
      # Yubikey
      ../../yubikey.nix
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/development.nix
      ../../packages/docker.nix
      ../../packages/user/fonts.nix
      ../../packages/user/fish.nix
      ../../packages/user/insync.nix
      ../../packages/user/gnupg.nix
      ../../packages/user/desktop/programs/kitty.nix
      ../../packages/user/desktop/programs/toggl.nix

      # Audio
      ../../packages/audio.nix
      ../../packages/user/desktop/programs/audio.nix

      # Bluetooth 
      ../../packages/bluetooth.nix

      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/i3.nix
      ../../packages/user/desktop/compton.nix

      # Audio
      ../../packages/audio.nix
      ../../packages/user/desktop/programs/audio.nix
    ];
    
  boot = {
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Graphic card settings
  services.xserver.videoDrivers = [ "nvidia" ];

  # 3D settings
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Printing
  
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cups-bjnp pkgs.gutenprintBin ];
  
  # This value determines the NixOS release with which your
  # system is to be compatible, in order to avoid breaking
  # some software such as database servers. You should
  # change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09";
  
  # Networking
  networking = {
    hostName = "desktop-work";
  };

  # Update settings
  system.autoUpgrade.enable = true;
  time.hardwareClockInLocalTime = true;

  # Overrides
  programs.fish = {
    shellInit = ''
      ${builtins.readFile ../../packages/user/fish/work.fish }
    '';
  };
}
