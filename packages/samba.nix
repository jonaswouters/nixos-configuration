{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Samba & Cifs
    smbclient
    cifs-utils
  ];
}
