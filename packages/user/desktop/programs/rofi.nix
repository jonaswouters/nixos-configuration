{ config, pkgs, lib, ... }:

let

in
{
  home-manager.users.jonaswouters = {
     programs.rofi = {
      enable = true;
    };
  };
}
