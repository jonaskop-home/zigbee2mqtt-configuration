# Zigbee2MQTT configuration

## Rootless

To mount usb devices to pods in Kubernetes you must run a privileged container. That is a security issue and should be done with caution. We do however want to secure our container a bit by running as an ordinary user instead of root and to do that while still being able to read from an USB you must mount that USB with read privileges for ordinary users.

1. Open cron configuration

```bash
sudo crontab -e
```

2. Add the following line. Replace ttyACM0 with your device.

```
@reboot sleep 10 && chmod 666 /dev/ttyACM0
```

<!--

1. List usb devices
```bash
lsusb -vvv
```  idVendor           0x1cf1 Dresden Elektronik
  idProduct          0x0030 ZigBee gateway [ConBee II]


2. Find your usb key and get the hex value at `idVendor` and `idProduct`

```
idVendor 0x1f34 Dresden Elektronik
idProduct 0x0245 ZigBee gateway [ConBee II]
```

3. Create or /etc/udev/rules.d/50-conbee-usb.rules and add the following. Replace `idVendor` and `idProduct` with your values

```
SUBSYSTEM=="usb", ATTR{idVendor}=="*", ATTR{idProduct}=="*", MODE="0660", GROUP="plugdev"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="1f34", ATTRS{idProduct}=="0245", GROUP="1000", OWNER="1000", MODE="0660"
```

4. Reboot machine

```bash
sudu reboot
```





ls -la /dev

@reboot chmod 666 /dev/ttyACM0 -->
