{ pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in  
{
  services.znc = {
    enable = true;
    
    openFirewall = true;
    confOptions = {
      networks = {
        freenode = {
          channels = [
            "nixos"
          ];
          modules = [ "log" "simple_away" ];
          server = "chat.freenode.net";
          port = 6697;
          useSSL = true;
          userName = secrets.username;
          password = secrets.ircPassword;
        };
      };
      
      modules = [ "adminlog" "log" ];
      nick = secrets.username;
    
      # passBlock with `nix-shell -p znc --command "znc --makepass"`.
      # and place it inside secrets.nix
      passBlock = secrets.zncPassBlock;
      
    };
    
    ## Enabled in next version 
    # useLegacyConfig = false;
    # config = 
    # {
    #   LoadModule = [ "webadmin" "adminlog" ];
    #   User.paul = {
    #     Admin = true;
    #     Nick = secrets.username;
    #     AltNick = "zertox";
    #     LoadModule = [ "chansaver" "controlpanel" ];
    #     Network.freenode = {
    #       Server = "chat.freenode.net +6697";
    #       LoadModule = [ "simple_away" ];
    #       Chan = {
    #         "#nixos" = { Detached = false; };
    #       };
    #     };
    #   };
    # };
  };
}
