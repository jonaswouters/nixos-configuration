{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true; 
  };
}
