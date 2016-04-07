#!/bin/bash

yum install -y iproute git epel-release
yum install -y python-pip libselinux-python
pip install --upgrade ansible
ansible-playbook site.yml -i hosts
