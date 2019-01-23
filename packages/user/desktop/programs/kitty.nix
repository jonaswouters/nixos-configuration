{ config, pkgs, ... }:
let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    kitty
  ];
}
