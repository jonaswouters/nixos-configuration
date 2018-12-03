{ config, pkgs, ... }:

{
  home-manager.users.jonaswouters = {
     xsession = {
      enable = true;
      
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
      };
      
      home.file."i3/config".source = "i3/config";
    };
  };
}
