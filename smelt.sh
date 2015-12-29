#!/bin/bash

yum install -y git epel-release
yum install -y ansible
ansible-playbook site.yml
