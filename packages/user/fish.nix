
{ config, pkgs, ... }:
let
  secrets = (import ../../private/secrets.nix);
  unstable = import <unstable> {};
in
{
  nixpkgs.config = {
      packageOverrides = pkgs: {
      fish = unstable.fish;
    };
  };

  programs.fish = {
    enable = true;
    shellInit = 
        ''
        ${builtins.readFile ./fish/config.fish }
        ${builtins.readFile ./fish/alias.fish }
        '';
  };

  users.extraUsers.${secrets.username} = {
    shell = "/run/current-system/sw/bin/fish";
  };
}
