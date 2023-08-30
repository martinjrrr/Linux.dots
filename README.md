# Linux.dots
KDE PLASMA Arch Linux



In the following repository I'm going to explain to my future self how to setup Arch linux and configure it perfectly.
Placeholder:
![image](https://github.com/martinjrrr/Linux.dots/assets/91160845/9085edc8-8a07-46fd-9cf8-0c71aa05d8d5)

Download the EDID File and CD into the directory

**cd ~/Downloads/**
Then we'll be copying the EDID to **/usr/lib/firmware/edid/**
sudo cp modified_edid.bin **/usr/lib/firmware/edid/**

If the directory does not exist - which is likely - we'll type *sudo mkdir **/usr/lib/firmware/edid/**

Now after we've done that, we'll open *grub.cfg* which is located in **/etc/default/** and write drm.edid_firmware=edid/modified_edid.bin 
at line GRUB_CMDLINE_LINUX_DEFAULT= and GRUB_CMDLINE_LINUX= respectively - then we'll save the document.

Now to execute the Kernel Patch we'll write "sudo grub-mkconfig -o /boot/grub/grub.cfg" into the terminal
