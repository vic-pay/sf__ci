#!/bin/sh
ansible-playbook ../playbook_reboot.yml -i ../inventory.yml -l ci-staging
