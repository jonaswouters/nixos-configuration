{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
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
