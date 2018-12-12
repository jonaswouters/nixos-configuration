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
      ../base-unstable.nix
      
      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/i3.nix
      ./trackpad.nix
      
      # Packages
      ../../packages/user/common.nix
      ../../packages/user/development.nix
      ../../packages/user/fonts.nix
      
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

  # ACPI
  services.acpid = {
    enable = true;
  };

  # Thinkpad x1 Backlight control via buttons
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 224 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -U 5"; }
      { keys = [ 225 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -A 5"; }
    ];
  };
}
