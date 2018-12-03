{ config, lib, pkgs, ... }:

{
  imports = [
    # Home manager import
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
  ];

  # Users
  users.users.jonaswouters = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    description = "Jonas Wouters";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wheel"
    ];
  };
  
  # Home manager
  home-manager.users.jonaswouters = { 
    programs.git = {
      enable = true;
      userName  = "Jonas Wouters";
      userEmail = "jonas@jw.be";
    };
    
    programs.ssh = {
      enable = true;
      forwardAgent = true;
      
    };
  };
}
