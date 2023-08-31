# Linux.dots



In the following `README.md` I'm going to explain to my future self how to setup KDE Arch and configure it so it just works

If anyone but myself uses this Repository for information I will not be held accountable for potentially bricking / breaking your systems or installs you have been warned!

![image](https://github.com/martinjrrr/Linux.dots/assets/91160845/1466e3f9-71c8-4329-878a-7066783d642f)


# Editing the EDID file

To follow this guide you can either download the modified_edid.bin and save it to ~/Downloads/ which may only work for my monitor or follow the step by step guide on how to edit your own EDID file
_____________________________________________________________________________________

`find /sys/devices/pci*/ -name edid` to find the EDID used by your monitor 

Output should look something like this:

`/sys/devices/pci0000:00/0000:00:03.1/0000:2b:00.0/0000:2c:00.0/0000:2d:00.0/drm/card1/card1-DP-1/edid`

You'll need to choose the connector of your monitor, for me it is card1-DP-1

Next I'll cd into the directory where my EDID is located and copy it:
`cd /sys/devices/pci0000:00/0000:00:03.1/0000:2b:00.0/0000:2c:00.0/0000:2d:00.0/drm/card1/card1-DP-1`

`cp edid ~/Downloads/`

Next you'll need to download wxEDID:

flatpak install https://dl.tingping.se/flatpak/wxedid.flatpakref

open the edid file which is now located in the `~/Downloads/` directory using wxEDID

edit it to disable YCbCr support:
_____________________________________________________________________________________

 `SPF: Supported features -> change value of vsig_format to 0b00`
 
 `CHD: CEA-861 header -> change the value of YCbCr420 and YCbCr444 to 0`
 
 `VSD: Vendor Specific Data Block -> change the value of DC_Y444 to 0`

Afterwards save the EDID binary and rename it to "modified_edid.bin" and save it to ~/Downloads/

_____________________________________________________________________________________

# Applying the EDID file to the kernel

Open a Terminal: 

`cd ~/Downloads/` Then we'll use sudo to copy the file to the following directory.

`sudo cp modified_edid.bin /usr/lib/firmware/edid/`

`sudo mkdir /usr/lib/firmware/edid/` in the terminal if the directory does not exist

`kate /etc/default/grub` to open the file and add

`drm.edid_firmware=edid/modified_edid.bin` 
after **GRUB_CMDLINE_LINUX_DEFAULT=** and **GRUB_CMDLINE_LINUX=** then save

`sudo grub-mkconfig -o /boot/grub/grub.cfg` in the terminal to apply the kernel patch
_____________________________________________________________________________________

**After a reboot the monitor should switch to the correct RGB values upon login**

Hopefully in the future we wont need to edit our EDID follow this thread on the issue:

https://gitlab.freedesktop.org/drm/amd/-/issues/476

_____________________________________________________________________________________

# Configuring Konsole and Grub Bootloader

We are now going to Setup an equivalent to OhMyZSH to make our terminal look better

`git clone https://github.com/christitustech/mybash`

`cd mybash`

`./setup.sh`

Then we will add any Nerdfont to the System https://www.nerdfonts.com/
So that the Bash config looks good.

`git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes`

`cd Top-5-Bootloader-Themes`

`sudo ./install.sh`

**Now we have configured our Bootloader and Konsole**
_____________________________________________________________________________________

# Utilities you'll need

All of these are to be installed using the yay package manager

`mesa-git` FOSS GPU Drivers

`radeon-profile-git` Radeon Overclocking and Fan Control utility

`radeon-profile-daemon-git` The needed daemon to run the Previous software

After finishing the Download you'll need to run the following commands in the terminal

`systemctl enable radeon-profile-daemon.service &&`

`systemctl start radeon-profile-daemon.service`

**Now Radeon-profile should be working and showing modules like fan control**


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

# Programs that are nice to have

`kgamma5`KDE Systemwide Gamma control

`ani-cli` anime from the terminal

`mangal`manga from the terminal

`speedtest-cli` speedtest from the terminal

`portmaster-stub-bin` safings portmaster system security software


_____________________________________________________________________________________

# Fix Steams CS:GO Crashes

To run CS:GO among other games correctly on Steam you'll need to follow these steps

In the Top Left then click on `Steam`
Click on `Settings`

Click on `In Game`

Click on `Enable the Steam Overlay while in-game`

Click on `Properties` on CS:GO

In the `General Tab` turn off `Enable the Steam Overlay while in Game`


**Now CS:GO should run perfectly**

_____________________________________________________________________________________

# Fix Minecraft not connecting to the sound engine

You'll need to add the line `drivers-alsa` to `/etc/openal/alsoft.conf`


`sudo mkdir /etc/openal/`  if the directory does not exist

`alsoft.conf` if the file does not exist to create it in your ~/Downloads/ directory

add the line `drivers-alsa` and save the file

`cd ~/Downloads/`

`sudo cp alsoft.conf /etc/openal/`


**Start / Restart Minecraft and it should have a working sound engine**

_____________________________________________________________________________________






