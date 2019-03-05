{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
    virtualisation.docker.enable = true;
}
