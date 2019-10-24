# Additional configuration

## Enable wifi

```
systemctl stop wpa_supplicant.service
wpa_supplicant -B -i wlp2s0 -c <(wpa_passphrase 'SSID' 'key')
```
Or set it up the right way
https://wiki.archlinux.org/index.php/WPA_supplicant
