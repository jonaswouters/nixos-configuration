{ config, pkgs, ... }:
let
  secrets = (import ../../../private/secrets.nix);
in
{
    services.compton = {
        enable = true;
        fade = true;
        fadeDelta = 5;
        # inactiveOpacity = "0.9";
        backend = "glx";
        vSync = "opengl-swc";
    };
}
