{ config, pkgs, ... }:

{
  imports =
    [
      ./base.nix
    ];
    
    # Set channel to unstable
    system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable/"
}
