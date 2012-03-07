#!/bin/bash
#http://chrisadams.me.uk/2010/05/10/setting-up-a-centos-base-box-for-development-and-testing-with-vagrant/

set -e
date > /etc/vagrant_box_build_time

# Update within point release.
yum -y update

# Installing vagrant keys.
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
wget --no-check-certificate -O /home/vagrant/.ssh/authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chown -R vagrant /home/vagrant/.ssh

# Remove Yum caches.
yum -y clean all

# Make image sparse by zeroing space.
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY

exit
