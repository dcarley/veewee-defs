#!/bin/bash
#http://chrisadams.me.uk/2010/05/10/setting-up-a-centos-base-box-for-development-and-testing-with-vagrant/

set -e
date > /etc/vagrant_box_build_time

fail()
{
  echo "FATAL: $*"
  exit 1
}

#yum -y update
#yum -y upgrade

# Installing vagrant keys.
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
wget -P /home/vagrant/.ssh --no-check-certificate 'http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
chown -R vagrant /home/vagrant/.ssh

# Installing the virtualbox guest additions.
yum -y install kernel-devel-`uname -r`
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
wget -P /tmp http://download.virtualbox.org/virtualbox/${VBOX_VERSION}/VBoxGuestAdditions_${VBOX_VERSION}.iso
mount -o loop /tmp/VBoxGuestAdditions_${VBOX_VERSION}.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm /tmp/VBoxGuestAdditions_${VBOX_VERSION}.iso

#poweroff -h
yum -y clean all

exit
