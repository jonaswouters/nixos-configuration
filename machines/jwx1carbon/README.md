# Additional configuration

## Enable wifi

```
systemctl stop wpa_supplicant.service
wpa_supplicant -B -i wlp2s0 -c <(wpa_passphrase 'SSID' 'key')
```
