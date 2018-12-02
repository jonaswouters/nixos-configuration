{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters.home.packages = with pkgs; [
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
