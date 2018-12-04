{ config, lib, pkgs, ... }:

let
  sshKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKBFYgkQJm64CKzv5lfzgWA8oRAaVSHQkPQBR/nk8TkykvEfJYRWcIvsiYjfJpJqdidsWQqbl9WxBL9raF6fZZ9XNIffofo+gyH+xn+m9haPyynSJbbvg47J4VJgKGF/8xGGOlaFERKaZLToPYhwq15jIxu5etwd+AbX/liCB1UIjpggvZ+XonGj0ULIPN9yA3kRaiv4NuLXSFlz2uIpluF+4PW5N8bHFmHS4D1w2hLHuJWBp73Puo9E7hpjn8HWB7QAklmruYFSgiyduhLIakAtIkWWd2SPfnilAUCqTmHJZuVK7oG5LJ1vr7k1OVQFwfleStPrqqlbRXeemf66xX jonas@jw.be";
  username = "jonaswouters";
  email = "jonas@jw.be";
  fullName = "Jonas Wouters";
in
{
  imports = [
    # Home manager import
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
  ];

  # Users
  users.users.${username} = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    description = "${fullName}";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      sshKey
    ];
  };
  
  # Home manager
  home-manager.users.${username} = { 
    programs.git = {
      enable = true;
      userName  = "${fullName}";
      userEmail = "jonas@jw.be";
    };
    
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
