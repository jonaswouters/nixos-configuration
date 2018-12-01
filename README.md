# nixos-configuration

## Installation:

During installation of nixos, right after the ```nixos-generate-config --root /mnt``` command

```
mv /mnt/etc/nixos /mnt/etc/nixos.install
git clone https://github.com/jonaswouters/nixos-configuration /mnt/etc/nixos
cp /mnt/etc/nixos.install/hardware-configuration.nix /mnt/etc/nixos/
ln -sr /mnt/etc/nixos/machines/$MACHINE.nix /mnt/etc/nixos/configuration.nix
```

Proceed with installation as normal.
