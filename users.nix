{ config, lib, pkgs, ... }:

let
  secrets = (import ./private/secrets.nix);
in
{
  imports = [
    # Home manager import
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
  ];

  # Users
  users.users.${secrets.username} = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    description = "${secrets.fullName}";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wheel"
      "libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      secrets.sshKey
    ];
  };
  
  # Home manager
  home-manager.users.${secrets.username} = {
    programs.ssh = {
      enable = true;
      forwardAgent = true;
    };
    
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
