
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
      ../users.nix
      ../packages/common.nix
    ];
    
    # Alow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # Enable OpenSSH
    services.openssh = {
      enable = true;
      passwordAuthentication = false;
    };
    
    # Enable gpg & ssh agent
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

        # Set channel to unstable
    system.autoUpgrade.channel = "https://nixos.org/channels/nixos-stable/";
}
