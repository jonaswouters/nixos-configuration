{ pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  environment.systemPackages = with pkgs; [
      unstable.rescuetime
  ];

  # start rescuetime at boot
  systemd.services.rescuetime = {
    description = "RescueTime time tracker";
    wantedBy = [ "graphical.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.rescuetime}/rescuetime";
    };
    environment = {
      DISPLAY = ":0";
    };
  };

  # systemd.services.rescuetime.enable = true;
}
