#!/bin/bash
apt-get update  # Get latest pkg list
sudo apt-get upgrade  # Update OS
apt-get install ansible -y  # Install ansible; no prompts
ansible-playbook -i ansible-stepmania/hosts ansible-stepmania/stepmania-install.yml
