#!/bin/bash
#if [! -n "$sudo ]; then
#	echo "ERROR: Environent variable 'sudo' is not set. This is needed to run commands as root, for example to build."
#	exit
#fi
echo "########"
echo "build step #1: deps"
echo "########"
echo "Checking for live-build..."
command -v live-build
if [ $? == 1 ]; then echo "live-build is not installed! You may want to install it."; exit; fi
echo ""
echo ""
echo "########"
echo "build step #2: retreive files outside the repo."
echo "########"
echo "Will put wget log in wget.log"
echo "">wget.log
echo ""
echo "kernel files (1/1)"
echo "- firmware images (1/4)"
#wget http://wolfmitchell.com/lp/linux-firmware-image_3.11.0-lp-1_i386.deb -O config/packages.chroot/linux-firmware-image.deb 2>&1 >> wget.log
echo "- headers (2/4)"
#wget http://wolfmitchell.com/lp/linux-headers-3.11.0-lp_3.11.0-lp-1_i386.deb -O config/packages.chroot/linux-headers.deb 2>&1 >> wget.log
echo "- image (3/4)"
#wget http://wolfmitchell.com/lp/linux-image-3.11.0-lp_3.11.0-lp-1_i386.deb -O config/packages.chroot/linux-image.deb 2>&1 >> wget.log
echo "- libc (4/4)"
#wget http://wolfmitchell.com/lp/linux-libc-dev_3.11.0-lp-1_i386.deb -O config/packages.chroot/linux-libc-dev.deb 2>61 >> wget.log
echo "done with retreiving kernel images."
echo ""
echo ""
echo "########"
echo "build step 3: cleaning up environment"
echo "########"
echo "logs of this step will be in cleanup.log"
echo "$sudo"|sudo -S echo "">cleanup.log
echo "$sudo"|sudo -S lb clean 2>&1 >> cleanup.log
echo ""
echo ""
echo "########"
echo "final stage: building"
echo "########"
echo "the output of this will go to stdout!"
echo "$sudo"|sudo -S lb build --linux-flavours i386

