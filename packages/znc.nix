{ pkgs, ... }:

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
          userName = "jonaswouters";
          password = (import ../secrets.nix).ircPassword;
        };
      };
      
      modules = [ "adminlog" "log" ];
      nick = "jonaswouters";
    
      # passBlock with `nix-shell -p znc --command "znc --makepass"`.
      # and place it inside secrets.nix
      passBlock = (import ../secrets.nix).zncPassBlock;
      
    };
    
    ## Enabled in next version 
    # useLegacyConfig = false;
    # config = 
    # {
    #   LoadModule = [ "webadmin" "adminlog" ];
    #   User.paul = {
    #     Admin = true;
    #     Nick = "jonaswouters";
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
