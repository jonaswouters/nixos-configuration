{ pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    unstable.insync
  ];

  # start rescuetime at boot
  systemd.services.insync = {
    description = "Insync headless";
    wantedBy = [ "multi-user.target" ]; 
    after = [ "network.target" ];
    serviceConfig = {
      User = "${secrets.username}";
      ExecStart = "${pkgs.insync}/bin/insync start --no-daemon";
      ExecStop = "${pkgs.insync}/bin/insync quit";
    };
  };

  # systemd.services.insync.enable = true;
}
