#!/bin/bash
echo "---------------------------"
echo "HELLO THIS IS ITG VIENNA :)"
echo "---------------------------"

# set fstab path variable
fstab=/etc/fstab

# locate P1 USB ports by-path
echo "\n\nPlug USB stick into target P1 USB port."
read -p "- Press any key to begin -" -n1 -s
echo -e "\n... searching P1 USB path ..."
sleep 8
P1_nodes=($(ls -t /dev/disk/by-path/ | head -1))

# locate P2 USB ports by-path
echo "\n\nUnplug from P1 USB Port, and plug into target P2 USB port."
read -p "- Press any key to begin -" -n1 -s
echo -e "\n... searching P2 USB path ..."
sleep 8
P2_nodes=($(ls -t /dev/disk/by-path/ | head -1))
echo "Unplug the USB Key from the Target P2 USB Port."

# locations found; proceed?
echo "\n\nThese paths were found:"
echo "------------"
echo "P1 USB path:"
echo "/dev/disk/by-path/${P1_nodes[0]}"
echo "------------"
echo "P2 USB path:"
echo "/dev/disk/by-path/${P2_nodes[0]}"

# confirm writing to fstab
read -p "\n\nWrite fstab and create mountpoints? (Yy/Nn)" -n1 answer
while true
do
  case $answer in
   [yY]* ) # write static mountpoints in fstab, if they not exist
           echo "\n... Writing /etc/fstab and creating mountpoints ...\n"
          mkdir /mnt/stepmania
          mkdir /mnt/stepmania/P1_USB
          mkdir /mnt/stepmania/P2_USB

           if grep -q "stepmania-usb-card-mount-tool" "$fstab";
            then
             echo "Stepmania USB ports already exist in /etc/fstab."
           else
             echo "\n# created by stepmania-usb-card-mount-tool" >> $fstab
             echo "/dev/disk/by-path/${P1_nodes[0]}	/mnt/stepmania/P1_USB	auto	uid=1000,gid=1000,rw,nofail,users,noatime,sync 0 0" >> $fstab
             echo "/dev/disk/by-path/${P2_nodes[0]}	/mnt/stepmania/P2_USB	auto	uid=1000,gid=1000,rw,nofail,users,noatime,sync 0 0" >> $fstab
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

   [nN]* ) echo -e "\nAborted: fstab not written."; exit ;;

   * )     echo -e "\nAborted: Only Y or N allowed - fstab not written. Aborted."; break ;;
  esac
done

ansible-playbook -i ansible-stepmania/hosts ansible-stepmania/install-sm5-usb.yml

echo "file:///mnt/stepmania/P1_USB P1_USB" >> /home/stepmania/.gtk-bookmarks
echo "file:///mnt/stepmania/P2_USB P2_USB" >> /home/stepmania/.gtk-bookmarks

# screensaver disable mate
# MATE autolaunch stepmania
