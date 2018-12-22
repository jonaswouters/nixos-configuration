{ config, pkgs, lib, ... }:

let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username} = {
     programs.termite = {
      enable = true;
    };
  };
}
