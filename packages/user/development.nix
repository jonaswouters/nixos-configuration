{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # Jetbrains
    jetbrains.datagrip
    jetbrains.goland
    jetbrains.idea-ultimate
    jetbrains.phpstorm
    jetbrains.webstorm
    
    # Visual Studio Code
    vscode
  ];
}
