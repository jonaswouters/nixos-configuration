{ config, pkgs, lib, ... }:

let

in
{
  home-manager.users.jonaswouters = {
     programs.termite = {
      enable = true;
    };
  };
}
