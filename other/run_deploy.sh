#!/bin/sh
ansible-playbook ../playbook_deploy.yml -i ../inventory_deploy.yml --ask-become-pass
