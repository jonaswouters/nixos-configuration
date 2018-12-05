{ config, pkgs, lib, ... }:

let

in
{
  home-manager.users.jonaswouters = {
     services.polybar = {
      enable = true;
    };
  };
}
