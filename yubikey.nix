{ config, lib, pkgs, ... }:
let 
  unstable = import <nixos-unstable> {};
in
{

  nixpkgs.config = {
      packageOverrides = pkgs: {
        pcscd = unstable.pcscd;
    };
  };

  # Enable smartcard daemon, to read TOPT tokens from yubikey
  services.pcscd.enable = true;

  # Enable u2f over USB, for yubikey auth in browser
  hardware.u2f.enable = true;

  environment.systemPackages = with pkgs; [
    unstable.gnupg
    unstable.yubikey-personalization
    unstable.yubikey-personalization-gui
    unstable.yubioath-desktop
    unstable.yubikey-manager
  ];

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];
}
