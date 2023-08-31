# Linux.dots



In the following `README.md` I'm going to explain to my future self how to setup Arch linux and configure it perfectly.
Placeholder:
![image](https://github.com/martinjrrr/Linux.dots/assets/91160845/a30f2fb4-e60a-46a6-9899-ae976429bf53)

# First we will be fixing the EDID 


Download the EDID File and CD into the directory

`cd ~/Downloads/` Then we'll use sudo to copy the file to the following directory.

`sudo cp modified_edid.bin /usr/lib/firmware/edid/`

`sudo mkdir /usr/lib/firmware/edid/` in the terminal if the directory does not exist

`kate /etc/default/grub` to open the file and add

`drm.edid_firmware=edid/modified_edid.bin` 
after **GRUB_CMDLINE_LINUX_DEFAULT=** and **GRUB_CMDLINE_LINUX=** then save

`sudo grub-mkconfig -o /boot/grub/grub.cfg` in the terminal to apply the kernel patch

_____________________________________________________________________________________

# Programs to have the system running well
