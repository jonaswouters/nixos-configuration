# nixos-configuration

## Installation:

During installation of nixos, right after the ```nixos-generate-config --root /mnt``` command

```
nix-env -i git
mv /mnt/etc/nixos /mnt/etc/nixos.install
git clone https://github.com/jonaswouters/nixos-configuration /mnt/etc/nixos
cp /mnt/etc/nixos.install/hardware-configuration.nix /mnt/etc/nixos/
ln -sr /mnt/etc/nixos/machines/$MACHINE/configuration.nix /mnt/etc/nixos/configuration.nix
```

Proceed with installation as normal.

## Post-Installation

### Machine specific
[Lenovo Thinkpad X1 Carbon 2018](machines/jwx1carbon/README.md)

### Mount SSH keys drive

```
mkdir -p /media/secret
mount /dev/disk/by-label/PRIVATE /media/secret


### Set user password

```
passwd jonaswouters
su - jonaswouters
```

### Copy over stuff

```
cp -R /media/secret/.aws ~/
cp -R /media/secret/.ssh ~/
chmod 700 ~/.ssh
chmod -R 600 ~/.ssh/id_rsa*
```
