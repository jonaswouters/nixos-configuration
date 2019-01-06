{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{

  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # Jetbrains
    unstable.jetbrains.datagrip
    unstable.jetbrains.goland
    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.phpstorm
    unstable.jetbrains.webstorm
    
    # Visual Studio Code
    unstable.vscode

    # Node
    unstable.nodejs-10_x
  ];
}
