{ pkgs, ... }:

{
  services.znc.enable = true;
  services.znc.useLegacyConfig = false;
  services.znc.config = 
  {
    LoadModule = [ "webadmin" "adminlog" ];
    User.paul = {
      Admin = true;
      Nick = "jonaswouters";
      AltNick = "zertox";
      LoadModule = [ "chansaver" "controlpanel" ];
      Network.freenode = {
        Server = "chat.freenode.net +6697";
        LoadModule = [ "simple_away" ];
        Chan = {
          "#nixos" = { Detached = false; };
        };
      };
    };
  };
}
