{ config, pkgs, ... }:
let
  secrets = (import ../../private/secrets.nix);
in
{
  imports =
  [
    # Programs
    ./git.nix
  ];
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    keybase
  ];

    # Enable Keybase service
    services.keybase = {
      enable = true;
    };
}
