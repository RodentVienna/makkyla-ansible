#!/bin/bash

echo "---------------------------"
echo "HELLO THIS IS ITG VIENNA :)"
echo "---------------------------"


# set fstab path variable
fstab=/etc/fstab


# locate P1 USB ports by-path
echo ""
echo "Plug USB stick into target P1 USB port."
read -p "- Press any key to begin -" -n1 -s
echo -e "\n... searching P1 USB path ..."
sleep 8
P1_nodes=($(ls -t /dev/disk/by-path/ | head -1))
echo ""


# locate P2 USB ports by-path
echo ""
echo "Unplug from P1 USB Port, and plug into target P2 USB port."
read -p "- Press any key to begin -" -n1 -s
echo -e "\n... searching P2 USB path ..."
sleep 8
P2_nodes=($(ls -t /dev/disk/by-path/ | head -1))
echo "Unplug the USB Key from the Target P2 USB Port."
echo ""


# locations found; proceed?
echo ""
echo "These paths were found:"
echo "------------"
echo "P1 USB path:"
echo "/dev/disk/by-path/${P1_nodes[0]}"
echo "------------"
echo "P2 USB path:"
echo "/dev/disk/by-path/${P2_nodes[0]}"
echo ""


# confirm writing to fstab
echo ""
read -p "Write fstab and create mountpoints? (Yy/Nn)" -n1 answer
while true
do
  case $answer in
   [yY]* ) # write static mountpoints in fstab, if they not exist
           echo "... Writing /etc/fstab and creating mountpoints ..."
		   	mkdir /mnt/stepmania
			mkdir /mnt/stepmania/player1
			mkdir /mnt/stepmania/player2
           echo ""
           if grep -q "stepmania-usb-card-mount-tool" "$fstab";
            then
             echo "Stepmania USB ports already exist in /etc/fstab."
           else
             echo "" >> $fstab
             echo "# created by stepmania-usb-card-mount-tool" >> $fstab
             echo "/dev/disk/by-path/${P1_nodes[0]}	/mnt/stepmania/player1	auto	uid=1000,gid=1000,rw,nofail,users,noatime,sync 0 0" >> $fstab
             echo "/dev/disk/by-path/${P2_nodes[0]}	/mnt/stepmania/player2	auto	uid=1000,gid=1000,rw,nofail,users,noatime,sync 0 0" >> $fstab
             echo -e "\nWritten to: /etc/fstab\n"
             echo "Check /etc/fstab just to be sure:"
             echo "------------"
             cat /etc/fstab | tail -3
             ls /mnt/stepmania
             echo "------------"
             gsettings set org.mate.media-handling automount false
             gsettings set org.mate.media-handling automount-open false
             gsettings set org.gnome.desktop.media-handling automount false
             gsettings set org.gnome.desktop.media-handling automount-open false
             echo "Script completed."
fi
           break;;

   [nN]* ) echo -e "\nAborted: fstab not written."; exit;;

   * )     echo -e "\nAborted: Only Y or N allowed - fstab not written. Aborted."; break ;;
  esac
done

## TO DO: ##
#write to preferences.ini:
#MemoryCardOsMountPointP1=/mnt/stepmania/player1
#MemoryCardOsMountPointP2=/mnt/stepmania/player2
#MemoryCards=1

#no compositor
# split nvidia
# split piuio
# autolaunch STEPMANIA
# screensaver disable mate
# MATE autolaunch stepmania
