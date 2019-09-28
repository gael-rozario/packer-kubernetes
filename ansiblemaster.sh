#!/bin/sh
useradd -m -p ansible@123 ansible
useradd -m -p gael@123 gaelrozario
mkdir /home/ansible/.ssh
mkdir /home/gaelrozario/.ssh
cd /home/ansible/.ssh
mv /tmp/keys/id_rsa .
mv /tmp/keys/id_rsa.pub .
chown ansible.ansible *
cat /tmp/keys/id_rsa_gael.pub >>/home/gaelrozario/.ssh/authorized_keys
chown ansible.ansible -R /home/ansible
chown gaelrozario.gaelrozario -R /home/gaelrozario
touch /etc/sudoers.d/ansible
touch /etc/sudoers.d/gael
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ansible
echo "gaelrozario ALL=(ALL) NOPASSWD:ALL">> /etc/sudoers.d/gael
cd /home/ansible
apt-get update && apt-get install git -y
cd /home/ansible
su ansible
git config --global user.name "gael"
git config --global user.email "gaelrozario@gmail.com"
git clone https://github.com/gael-rozario/ansible-kubernetes.git
