# Zigbee2MQTT configuration

## Rootless

To mount usb devices to pods in Kubernetes you must run a privileged container. That is a security issue and should be done with caution. We do however want to secure our container a bit by running as an ordinary user instead of root and to do that while still being able to read from an USB you must mount that USB with read privileges for ordinary users.

1. List usb devices

````bash
lsusb -vvv
```


2. Find your usb key and get the hex value at `idVendor` and `idProduct`

````

idVendor 0x1f34 Dresden Elektronik
idProduct 0x0245 ZigBee gateway [ConBee II]

```

3. Create or /etc/udev/rules.d/50-conbee-usb.rules and add the following. Replace `idVendor` and `idProduct` with your values

```

SUBSYSTEMS=="usb", ATTRS{idVendor}=="1f34", ATTRS{idProduct}=="0245", GROUP="1000", OWNER="1000", MODE="0660"

````

4. Reboot machine

```bash
sudu reboot
````
