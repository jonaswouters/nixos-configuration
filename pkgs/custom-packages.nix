{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
in
rec {
  pkgconfig = import ./pkgs/pkgconfig {
    inherit (pkgs) stdenv fetchurl automake;
  };
  
  rofi-calc = import ./pkgs/rofi-calc {
    # The remaining dependencies come from Nixpkgs
    inherit (pkgs) stdenv fetchurl glib file perl;
    inherit (pkgs) zip unzip gettext slang e2fsprogs;
    inherit (pkgs.xlibs) libX11 libICE;
  };
}
