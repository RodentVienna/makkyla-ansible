# makkyla-ansible
HELLO THIS IS ITG VIENNA :)

Thank you Kauhsa, Garrett, Rubbinnexx and hanzi for your eternal support!

This is ansible automation for stepmania on debian 9, based on Kauhsa's project, but edited to be more generic + added scripts (To DO) for updating stuff (piuio, sm, themes) from github repos.

	--> Ansible: http://docs.ansible.com/ansible/latest/

This turned out to be pretty much automatic and straight forward:

1) download Linux Mint MATE Stable Desktop ISO. In my Case: linuxmint-18.3-mate-64bit.iso
	--> Get it from: https://linuxmint.com/edition.php?id=248

2) install with default settings but use this user to make this ansible playbook work:
	setup user stepmania (no password)
	setup a password of your choice
	enable autologin

3) download this repo content directly in your fresh Linux Mint installation, and unpack it  (i did it in downloads)

4a) if you need PIUIO support, and NVIDIA Graphics Driver, uncomment the entries in makkyla-ansible/ansible-stepmania/install-sm5.yml

4b) enter the directory where the install-sm5.sh resides, right-click install-sm5.sh and choose "Properties/Permissions", then enable "Allow executing File as program."
  Close the dialogue, right click in the file manager window and choose "Open in Terminal" (open up a command line) and enter
	sudo ./install-sm5.sh
   you are prompted for the administrator password, which you have set upon Linux Mint installation.

5) wait until everything has finished, then reboot for all changes to take place

6) stepmania will now autolaunch at machine boot
  !! TO DO !! :-)

7) you may need to setup your sound device and usb profile card paths
   please refer to stepmania github wiki: https://github.com/stepmania/stepmania/wiki


Wanna use USB Cards for Player Profiles?

1) enter the directory where the install-sm5-usb.sh resides, right-click install-sm5-usb.sh and choose "Properties/Permissions", then enable "Allow executing File as program."
  Close the dialogue, right click in the file manager window and choose "Open in Terminal" (open up a command line) and enter
	sudo ./install-sm5-usb.sh

2) Amend following lines in /home/stepmania/.stepmania-5.1/Save/Preferences.ini to:
  MemoryCardOsMountPointP1=/mnt/stepmania/player1
  MemoryCardOsMountPointP2=/mnt/stepmania/player2
  MemoryCards=1

  !! TO DO: automatic Preferences.ini enable USB and Mountpoint setup !!


To Do / Ideas:

- automate finding the proper sound driver / sound hw and adding it to stepmania preferences
- update .sh or ansble scripts for updating stepmania and simply love theme in a non-destructive way (e.g. backup each build somewhere)
