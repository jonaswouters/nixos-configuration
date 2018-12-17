{ config, pkgs, ... }:

{
  imports =
    [
      ../base.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.copyKernels = true;
  boot.loader.grub.fsIdentifier = "label";
  boot.loader.grub.extraConfig = "serial; terminal_input serial; terminal_output serial";
  boot.kernelParams = [ "console=ttyS0" ];
  
  # Fix error: unable to fork: Cannot allocate memory
  # https://github.com/NixOS/nix/issues/421
  boot.kernel.sysctl."vm.overcommit_memory" = "1";

  services.longview = {
    enable = true;
    apiKey = "";

    apacheStatusUrl = "";
    nginxStatusUrl = "";

    mysqlUser = "";
    mysqlPassword = "";
  };
}
