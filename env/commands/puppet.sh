#!/bin/bash

echo 'domain example.com' >> /etc/resolv.conf

mkdir /tmp/vagrant-puppet
cp -R /vagrant/env/* /tmp/vagrant-puppet
mv /tmp/vagrant-puppet/commands/Puppetfile /tmp/vagrant-puppet/Puppetfile
cd /tmp/vagrant-puppet
librarian-puppet install > /dev/null
puppet apply /tmp/vagrant-puppet/manifests/default.pp --modulepath '/tmp/vagrant-puppet/modules:/etc/puppet/modules'  --hiera_config /tmp/vagrant-puppet/hiera.yaml