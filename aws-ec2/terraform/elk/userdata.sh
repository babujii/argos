#!/bin/bash -eux

# set the HOME variable, https://github.com/ansible/ansible/issues/31617
export HOME=/root

# download the packer-aws-elk-monitoring project
git clone https://github.com/apolloclark/packer-aws-elk /root/packer-aws-elk
cd /root/packer-aws-elk/config/ansible

# download the ansible playbooks into the "roles" folder
ansible-galaxy install --force -v --roles-path='./roles' --role-file='./requirements.yml'

# run the playbook, against localhost
ansible-playbook playbook.yml

# run serverspec tests
cd ../
source /usr/local/rvm/scripts/rvm
rake spec
