#!/bin/bash

yum install -y iproute git epel-release
yum install -y ansible
ansible-playbook site.yml
