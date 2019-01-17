{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    (neovim.override { vimAlias = true; })

    # Development
    gitAndTools.tig
    gitAndTools.git

    # Admin
    htop
    pciutils
    tree
    wget
    curl
    tmux
    ncdu # Disk usage
    ripgrep # Better than grep
  ];
}
