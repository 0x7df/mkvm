# mkvm - Make virtual machine
# This script configures an Ubuntu virtual machine how I like it

sudo apt-get -y update                  # Must be done before upgrade
sudo apt-get -y dist-upgrade            # Does upgrade with intelligent dependency-handling

sudo apt-get -y install dkms		# For installing VirtualBox Linux Guest Additions (https://www.virtualbox.org/manual/ch04.html)

sudo apt-get -y install git
sudo apt-get -y install nedit
sudo apt-get -y install python-numpy	# Contains, amongst other things, f2py
sudo apt-get -y install python-dev	# For Python.h; required by f2py
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-scipy
sudo apt-get -y install gfortran
sudo apt-get -y install python-pip	# So we can install Robot Framework
sudo apt-get -y install python-matplotlib
sudo apt-get -y install okular
sudo apt-get -y upgrade graphviz
sudo apt-get -y install texlive
sudo apt-get -y install doxygen
sudo apt-get -y install firefox

sudo pip install robotframework
sudo pip install prospector[with_frosted]
sudo pip install prospector[with_pyroma]
sudo pip install prospector[with_vulture]

sudo add-apt-repository ppa:staticfloat/juliareleases
sudo add-apt-repository ppa:staticfloat/julia-deps
sudo apt-get -y install julia

touch ${HOME}/.pythonrc.py

echo "
# Set Python startup file location in PYTHONSTARTUP environment variable
export PYTHONSTARTUP=\"${HOME}/.pythonrc.py\"
" >> ${HOME}/.bashrc

# Put the .gitconfig file in the right place and open it up for editing
mv --no-clobber ./.gitconfig_template ~/.gitconfig
git config --global --edit

# If Java JDK is required, determine the path:
#   > update-alternatives --config java
# Set JAVA_HOME=/usr/bin/java (or wherever) in /etc/environment, which is the preferred location for JAVA_HOME or any system variable.

echo "
# Now install the Linux Guest Additions for VirtualBox. Go to the
# \"Devices\" menu of VirtualBox when the VM is running (make sure it is not in
# stretch mode or the menu bar will not be visible); select \"Insert Guest
# Additions CD image...\"; then run VBoxLinuxAdditions.run with administrator
# privileges. Re-boot the VM; after this the VM desktop should resize with the
# VirtualBox window, rather than being a fixed (small) size.
"
