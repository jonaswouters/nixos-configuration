{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true; 
    package = pkgs.pulseaudioFull;

    # Extra bluetooth packages
    # extraModules = [ pkgs.pulseaudio-modules-bt ];
  };
}
