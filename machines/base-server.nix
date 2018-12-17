{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./base.nix
    ];
}
