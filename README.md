# Linux.dots



In the following `README.md` I'm going to explain to my future self how to setup KDE Arch and configure it perfectly.

![image](https://github.com/martinjrrr/Linux.dots/assets/91160845/1466e3f9-71c8-4329-878a-7066783d642f)


# First we will be fixing the EDID / AMD RGB Values


Download the EDID File and CD into the directory

`cd ~/Downloads/` Then we'll use sudo to copy the file to the following directory.

`sudo cp modified_edid.bin /usr/lib/firmware/edid/`

`sudo mkdir /usr/lib/firmware/edid/` in the terminal if the directory does not exist

`kate /etc/default/grub` to open the file and add

`drm.edid_firmware=edid/modified_edid.bin` 
after **GRUB_CMDLINE_LINUX_DEFAULT=** and **GRUB_CMDLINE_LINUX=** then save

`sudo grub-mkconfig -o /boot/grub/grub.cfg` in the terminal to apply the kernel patch

**After a reboot the monitor should switch to the correct RGB values upon login**

_____________________________________________________________________________________

# Programs you'll need

All of these are to be installed using the yay package manager

`radeon-profile-git`

`radeon-profile-daemon-git`

After compilation you'll need to run the following commands in the terminal

`systemctl enable radeon-profile-daemon.service &&`

`systemctl start radeon-profile-daemon.service`

**Now Radeon-profile should be working and showing modules like fan control**

_____________________________________________________________________________________


`openrgb`

`i2c-tools`

Before launching we'll need to execute a few commands

`sudo modprobe i2c-dev` to load the i2c-dev module

`sudo groupadd --system i2c` to create the i2c group if it does not already exist

`sudo usermod $USER -aG i2c` to add yourself to the i2c group

`sudo touch /etc/modules-load.d/i2c.conf &&` 

`sudo sh -c 'echo "i2c-dev" >> /etc/modules-load.d/i2c.conf'` to load the i2c-dev module at boot

**Now OpenRGB should also show RAM Modules**

_____________________________________________________________________________________


To run CS:GO among other games correctly on Steam you'll need to follow these steps

Open `Settings`

Click on `In Game`

Click on `Enable the Steam Overlay while in-game`


Click on `Properties` on CS:GO

In the `General Tab` turn off `Enable the Steam Overlay while in Game`

