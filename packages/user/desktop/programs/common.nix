{ config, pkgs, ... }:
let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    google-chrome
    spotify
    discord
    slack
    yubikey-personalization
    yubikey-personalization-gui
    yubioath-desktop
    ranger
  ];

  # Enable smartcard daemon, to read TOPT tokens from yubikey
  services.pcscd.enable = true;

  # Enable u2f over USB, for yubikey auth in browser
  hardware.u2f.enable = true;

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];
}
