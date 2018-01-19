# makkyla-ansible
ITG Vienna - ansible

Testing ansible automation for stepmania based on Kauhsa's project, but edited to be more generic + added scripts for updating stuff (piuio, sm, themes) from github repos.

To Do:
1) generalize and optionalize
2) create automation .sh scrips for post-install updates of piuio/sm/themes/other-stuff

Steps to reproduce:
1) download Debian Stable Desktop ISO. In this Case: debian-9.3.0-amd64-xfce-CD-1.iso
2) install with settings as you wish, but use these to make ansible work:
    tick SSH to install
    setup user stepmania
3) get ansible installed:
    mkdir /opt/ansible-git/
    cd /opt/ansible-git/
    then work through this tutorial: https://linuxconfig.org/ansible-installation-on-debian-9-stretch-linux-from-source
4) get ansible to import ssh-key and begin automation
    XX
5) XX
    XX

Notes to self:
1) add ppa in ansible: https://stackoverflow.com/questions/29319752/how-can-i-add-a-ppa-repository-using-ansible
2) for theme dev additionally install meld (main), brackets (ppa)

