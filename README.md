# nixos-configuration

## Installation:

After install and rebooting

### Add channels

```
nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --update nixos-unstable
```

### Mount SSH keys drive

```
mkdir -p /media/secret
mount /dev/disk/by-label/PRIVATE /media/secret
```

### Clone configuration repos

```
nix-shell -p git vim
mv /etc/nixos /etc/nixos.install
git clone https://github.com/jonaswouters/nixos-configuration /etc/nixos
cp /etc/nixos.install/hardware-configuration.nix /etc/nixos/
ln -sr /etc/nixos/machines/$MACHINE/configuration.nix /etc/nixos/configuration.nix

ssh-agent bash -c 'ssh-add /media/secret/.ssh/id_rsa; git submodule update --init --recursive -j 8'

```

### Machine specific

[Lenovo Thinkpad X1 Carbon 2018](machines/jwx1carbon/README.md)

###

```
nixos-rebuild build
```

### Set user password

```
passwd jonaswouters
su - jonaswouters
```

### Copy over stuff

```
cp -R /media/secret/.aws ~/
cp -R /media/secret/.ssh ~/
cp -R /media/secret/.gnupg ~/
chmod 700 ~/.ssh
chmod -R 600 ~/.ssh/id_rsa*
```

### Make config editable for user

```
sudo chown -R jonaswouters /etc/nixos/
cd /etc/nixos/
```

### Fix configuration origin location

```
git remote set-url origin git@github.com:jonaswouters/nixos-configuration.git
```
