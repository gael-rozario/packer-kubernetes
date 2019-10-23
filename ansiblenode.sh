#!/bin/sh
useradd -m -p ansible@123 ansible
mkdir /home/ansible/.ssh
cd /home/ansible/.ssh
touch authorized_keys
chown ansible.ansible -R /home/ansible
cat /tmp/keys/id_rsa.pub >> ./authorized_keys
touch /etc/sudoers.d/ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ansible
