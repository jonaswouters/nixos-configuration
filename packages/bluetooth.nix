{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
  # Bluetooth
  hardware.bluetooth.enable = true;

  # Bluetooth gui manager
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    blueman
  ];
}
