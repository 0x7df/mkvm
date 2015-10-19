# mkvm - Make virtual machine
# This script configures an Ubuntu virtual machine how I like it

sudo apt-get -y update                  # Must be done before upgrade
sudo apt-get -y dist-upgrade            # Does upgrade with intelligent dependency-handling

sudo apt-get -y install dkms		# For installing VirtualBox Linux Guest Additions (https://www.virtualbox.org/manual/ch04.html)

sudo apt-get -y install git
sudo apt-get -y gitk
sudo apt-get -y install python-numpy	# Contains, amongst other things, f2py
sudo apt-get -y install python-dev	# For Python.h; required by f2py
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-scipy
sudo apt-get -y install python-pip
sudo apt-get -y install gfortran
sudo apt-get -y install okular
sudo apt-get -y upgrade graphviz
sudo apt-get -y install texlive
sudo apt-get -y install doxygen
sudo apt-get -y install firefox
sudo apt-get -y install vim-gnome
sudo apt-get -y install kdiff3

sudo pip install robotframework
sudo pip install prospector[with_frosted]
sudo pip install prospector[with_pyroma]
sudo pip install prospector[with_vulture]
sudo pip install plotly --upgrade
sudo pip install markdown # Required for Pelican
sudo pip install pelican
sudo pip install typogrify # Required for pelican_plugin-render_math

sudo add-apt-repository -y ppa:staticfloat/juliareleases
sudo add-apt-repository -y ppa:staticfloat/julia-deps
sudo apt-get -y install julia

sudo apt-get -y install dos2unix

sudo apt-get -y autoremove
sudo apt-get -y clean

# Standard .bashrc and Python startup
[ -s ${HOME}/.bashrc ] || cp ./.bashrc_template ${HOME}/.bashrc

# Check for PYTHONSTARTUP
grep "export PYTHONSTARTUP" ${HOME}/.bashrc 2>&1 > /dev/null
if [ "$?" -ne 0 ] ; then
    echo "" >> ${HOME}/.bashrc
    echo "# Set Python startup file location in PYTHONSTARTUP environment variable" >> ${HOME}/.bashrc
    echo "export PYTHONSTARTUP=\"/home/x7df/.pythonrc.py\"" >> ${HOME}/.bashrc
fi

# Put the .pythonrc.py file in the right place 
[ -s ${HOME}/.pythonrc.py ] || cp ./.pythonrc.py_template ${HOME}/.pythonrc.py

# Put the .gitconfig file in the right place and open it up for editing
[ -s ${HOME}/.gitconfig ] || cp ./.gitconfig_template ${HOME}/.gitconfig
git config --global --edit

# Put the .vimrc file in the right place
[ -s ${HOME}/.vimrc ] || cp ./.vimrc_template ${HOME}/.vimrc

# Add the Nest theme for Pelican
cd /usr/local/lib/python2.7/dist-packages/pelican/themes/ && \
sudo git clone https://github.com/molivier/nest.git

cd ~ && \
git clone https://github.com/barrysteyn/pelican_plugin-render_math.git

# Set up a few things
mkdir -p ${HOME}/bin
sudo mkdir -p /mnt/Programming

# Add user to group vboxsf to get access to auto-mounted shared folders
sudo usermod -a -G vboxsf $(whoami)
