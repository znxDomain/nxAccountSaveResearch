How-To Artifically Link a Nintendo ID
======

I use MacOS for this process.

Requirements
------
- Hekate/Nyx https://github.com/CTCaer/hekate
- NinFS https://github.com/ihaveamac/ninfs
- HexFiend http://ridiculousfish.com/hexfiend/


Step by Step
------
1. boot hekate
1. change the the usb tools page
1. turn off "read only" in hekate
1. click "emmc raw"
1. click "ignore" not eject or initialize (initialize would really mess up your switch)
1. open a privelleged shell in Terminal: `sudo su -`
1. run `mount_nandhac -o allow_other --keys prod.keys /dev/rdisk3 /Volumes/emmc`
1. Find the and mount "SYSTEM.img"
1. copy /save/8000000000000010 to your working directory
1. extract the save with: `dotnet hactoolnet.dll -k prod.keys -t save 8000000000000010 --outdir linkedUser`
1. edit in the file `save:/su/avators/profiles.dat` (I use HexFiend)
1. skip the 0x10 header and add the following user at the next available 200 (0xC8) byte offsets
   ```
   381CADFE 00001000 868A4F4D F389A8F7 5D09309F 00001000 AF480ADE 25570A8B 
   00000000 5CD1BC6B 564B3A6E 696E6366 77000000 00000000 00000000 00000000 
   00000000 00000000 01000000 02000000 1C000010 00000000 00000000 00000000 
   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
   00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
   00000000 00000000
   ```
1. edit the file `save:/su/registry.dat`
1. skip the 16 byte header, and 16 byte system user, and add this user uuid at the next available 16 byte offsets
   ```
   381CADFE 00001000 868A4F4D F389A8F7
   ```
1. Add these file to your save structure
   ```
   save:/su/nas/f12e677eb4021a81_user.json
   save:/su/nas/f12e677eb4021a81_refresh.token
   save:/su/nas/f12e677eb4021a81_id.token
   save:/su/nas/f12e677eb4021a81.dat
   save:/su/baas/381cadfe-0000-1000-868a-4f4df389a8f7.dat
   save:/su/avators/381cadfe-0000-1000-868a-4f4df389a8f7.jpg
   ```
1. repack and sign the save with: `dotnet hactoolnet.dll -k prod.keys -t save 8000000000000010 --repack linkedUser`
1. replace the 8000000000000010 save file on the emmc
1. unmount/eject the mounted SYSTEM.img
1. unmount/eject the mounted /dev/rdisk3
1. unmount/eject the hekate emmc (Disk Utility is easy for this)
1. click close in hekate
1. boot cfw
