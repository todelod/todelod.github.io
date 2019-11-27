Linux
=====

Clearlinux
----------

### General tips and tricks

[clearlinux-desktop-setup](https://openwebcraft.com/notes/clearlinux-desktop-setup/)


### Kernel

```bash

pull changes

update spec (new version)

make source (downloads)

update / check config

cpy config to .config

make build

rpm2cpio rpms/linux_th-5.3.9-863.x86_64.rpm | (cd /; sudo cpio -i -d -u -v); 

sudo clr-boot-manager update

sudo clr-boot-manager list

```

[kernel howto](https://docs.01.org/clearlinux/latest/guides/kernel/kernel-development.html)

### VSCodium

#### Install 

```bash
sudo rpm -ivh --nodeps https://github.com/VSCodium/vscodium/releases/download/1.40.2/codium-1.40.2-1574798730.el7.x86_64.rpm
```

#### List and remove old (needs to be done before installing new version)

```bash  
sudo rpm -qa

sudo rpm -r codium-1.40.0-1573156686.el7.x86_64
```

Smokeping
---------

### Fix error not reporting on armbian

```bash  
  sudo chown root:root /path/to/fping
  sudo chmod 4755 /path/to/fping
```

[Test](linux/test.md)
