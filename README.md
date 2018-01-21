# makkyla-ansible
HELLO THIS IS ITG VIENNA :)

Thank you Kauhsa, Rubbinnexx and hanzi for your eternal support!

This is ansible automation for stepmania on debian 9, based on Kauhsa's project, but edited to be more generic + added scripts (To DO) for updating stuff (piuio, sm, themes) from github repos.

	Ansible: http://docs.ansible.com/ansible/latest/
	
This turned out to be pretty much automatic and straight forward:

1) download Debian Stable Desktop ISO. In my Case: debian-9.3.0-amd64-xfce-CD-1.iso
	--> Get it from: https://www.debian.org/CD/http-ftp/#stable
	
2) install with default settings but use this user to make this ansible playbook work:
	setup user stepmania (no password)
	setup admin password

3) download thsi repo content, and unpack it on your debian installation (i did it in downloads)

4) enter the directory where the install.sh resides, open up a command line and enter
	sudo ./install.sh
   you are prompted for the administrator password, which you have set upon debian installation.

5) wait until everything has finished, then reboot for all changes to take place

6) stepmania will now autolaunch at machine boot

7) you may need to setup your sound device and usb profile card paths
   please refer to stepmania github wiki: https://github.com/stepmania/stepmania/wiki


To Do / Ideas:

- automate finding the proper sound driver / sound hw and adding it to stepmania preferences
- automate the whole USB card setup + mount process
- update .sh or ansble scripts for updating stepmania and simply love theme in a non-destructive way (e.g. backup each build somewhere)
