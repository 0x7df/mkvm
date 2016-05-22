#!/bin/bash
#
# mkvm - Make virtual machine
# This script configures an Ubuntu virtual machine how I like it

# Install software - run as sudo
# ------------------------------

sudo -H ./mkvm-install.sh

# Configure - run as user
# -----------------------

./mkvm-configure.sh
