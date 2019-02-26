
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
      ../users.nix
      ../packages/common.nix
    ];
    
    nixpkgs.config = {
       # Alow unfree packages
      allowUnfree = true;

      # Create an alias for the unstable channel
      packageOverrides = pkgs: {
        unstable = import <unstable> {
          config = config.nixpkgs.config;
        };
      };
    };
    
    # Enable OpenSSH
    services.openssh = {
      enable = true;
      passwordAuthentication = false;
    };

    # Set channel to unstable
    system.autoUpgrade.channel = "https://nixos.org/channels/nixos-stable/";
}
