{ config, pkgs, lib,... }:

{
  # Channels
  #nix.nixPath = lib.mkDefault (lib.mkBefore [
  #  "nixpkgs=https://nixos.org/channels/nixos-18.09"
  #  "nixos-hardware=https://github.com/NixOS/nixos-hardware/archive/master.tar.gz"
  #]);

  imports =
    [
      <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
      ../base-workstation.nix
      ../../private/thinkpadje-wifi.nix

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
      ./trackpad.nix
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/development.nix
      ../../packages/user/fonts.nix
      ../../packages/user/gnupg.nix
      
    ];
    
  # Boot settings
  boot = {
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  
  # This value determines the NixOS release with which your
  # system is to be compatible, in order to avoid breaking
  # some software such as database servers. You should
  # change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09";
  
  # Networking
  networking = {
    hostName = "thinkpadje";
    wireless.enable = true;
  };

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cups-bjnp pkgs.gutenprintBin ];

  # ACPI
  services.acpid = {
    enable = true;
  };

  # Update settings
  system.autoUpgrade.enable = true;
  time.hardwareClockInLocalTime = true;

  # Power management
  environment.systemPackages = with pkgs; [
    powertop
    wpa_supplicant_gui
  ];

  # Overrides
  programs.fish = {
    shellInit = ''
      ${builtins.readFile ../../packages/user/fish/work.fish }
    '';
  };

  # Thinkpad x1 Backlight control via buttons
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 224 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -U 5"; } # Light -
      { keys = [ 225 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -A 5"; } # Light +
    ];
  };
}
