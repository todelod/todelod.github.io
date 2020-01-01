I was able to get it working!

The problem seems to be that the installer is built with grub 2.02, but the 7390 requires 2.04 to work. So we need to rebuild the efi file. The following worked for me:

Create bootable Pop OS 19.10 USB with Etcher

Mount FAT partition via Gnome Disks

Run the following commands

cd /media/user/POP OS ...

cd efi/boot

sudo grub-mkimage -o fromub.efi -p /EFI/boot -O x86_64-efi fat iso9660 part_gpt part_msdos normal boot linux configfile loopback chain halt efifwsetup efi_gop ls search search_label search_fs_uuid search_fs_file gfxmenu gfxterm gfxterm_background gfxterm_menu test all_video loadenv exfat ext2 ntfs btrfs hfsplus udf videoinfo png echo serial

Reboot into BIOS

Add boot option mapping to /efi/boot/fromub.efi

Reboot (loads Grub this time)

Run the following commands in Grub:

set prefix=(cd0)/boot/grub

set root=(cd0)

insmod linux

insmod normal

normal

Boots into Pop OS installer!
