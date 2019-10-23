#!/bin/sh
useradd -m -p ansible@123 ansible
useradd -m -p gael@123 gaelrozario
mkdir /home/ansible/.ssh
mkdir /home/ansible/.secret
mkdir /home/gaelrozario/.ssh
cd /home/ansible/.ssh
mv /tmp/keys/id_rsa .
mv /tmp/keys/id_rsa.pub .
mv /tmp/keys/angelic-bond-246708-f9ea847a05d2.json /home/ansible/.secret/angelic-bond-246708-f9ea847a05d2.json
chown ansible.ansible *
cat /tmp/keys/id_rsa_gael.pub >>/home/gaelrozario/.ssh/authorized_keys
chown gaelrozario.gaelrozario -R /home/gaelrozario
touch /etc/sudoers.d/ansible
touch /etc/sudoers.d/gael
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ansible
echo "gaelrozario ALL=(ALL) NOPASSWD:ALL">> /etc/sudoers.d/gael
cd /home/ansible
apt-get update
apt-add-repository ppa:ansible/ansible
apt-get update && apt-get install git -y
apt-get install ansible -y
sed 's/.*host_key_checking*/host_key_checking/' /etc/ansible/ansible.cfg >> /home/ansible/ansible-back.cfg
mv /home/ansible/ansible-back.cfg /etc/ansible/ansible.cfg
cd /home/ansible
su ansible
echo "export GOOGLE_APPLICATION_CREDENTIALS=~/.secret/angelic-bond-246708-f9ea847a05d2.json">> /home/ansible/.bashrc
echo "export PROJECT_ID=angelic-bond-246708" >>/home/ansible/.bashrc
git config --global user.name "gael"
git config --global user.email "gaelrozario@gmail.com"
git clone https://github.com/gael-rozario/ansible-kubernetes.git
git clone https://github.com/gael-rozario/gcp-ansible-dyn-inv.git
chown ansible.ansible -R /home/ansible/
