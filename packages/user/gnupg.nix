{ pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.services.gpg-agent = {
    enable = true;
    defaultCacheTtlSsh = 28800;
    maxCacheTtlSsh = 28800;
    defaultCacheTtl = 28800;
    maxCacheTtl = 28800;
    enableSshSupport = true;
  };
}
