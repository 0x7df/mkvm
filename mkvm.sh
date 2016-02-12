# mkvm - Make virtual machine
# This script configures an Ubuntu virtual machine how I like it

if [ $(whoami) != "root" ] ; then
    echo ; echo "Run as root:"
    echo ; echo "    sudo ./mkvm.sh"
    echo
    exit 1
fi

apt-get -y update                  # Must be done before upgrade
apt-get -y dist-upgrade            # Does upgrade with intelligent dependency-handling

apt-get -y install dkms		# For installing VirtualBox Linux Guest Additions (https://www.virtualbox.org/manual/ch04.html)

apt-get -y install git
apt-get -y install gitk
apt-get -y install python-numpy	# Contains, amongst other things, f2py
apt-get -y install python-dev	# For Python.h; required by f2py
apt-get -y install python-matplotlib
apt-get -y install python-scipy
apt-get -y install python-pip
apt-get -y install gfortran
apt-get -y install okular
apt-get -y upgrade graphviz
apt-get -y install texlive
apt-get -y install doxygen
apt-get -y install firefox
apt-get -y install vim-gnome
apt-get -y install kdiff3

pip install --upgrade pip
pip install --upgrade robotframework
pip install --upgrade prospector[with_frosted]
pip install --upgrade prospector[with_pyroma]
pip install --upgrade prospector[with_vulture]
pip install --upgrade plotly
pip install --upgrade markdown # Required for Pelican
pip install --upgrade pelican
pip install --upgrade ghp-import # Pelican - "make github"
pip install --upgrade typogrify # Required for pelican_plugin-render_math

add-apt-repository -y ppa:staticfloat/juliareleases
add-apt-repository -y ppa:staticfloat/julia-deps
apt-get -y install julia

apt-get -y install dos2unix

apt-get -y autoremove
apt-get -y clean

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
[ -s ${HOME}/.gitconfig ] && mv ${HOME}/.gitconfig ./.gitconfig_backup
cp ./.gitconfig_template ${HOME}/.gitconfig

# Put the .vimrc file in the right place
[ -s ${HOME}/.vimrc ] || cp ./.vimrc_template ${HOME}/.vimrc

# Add the Nest theme for Pelican
cd /usr/local/lib/python2.7/dist-packages/pelican/themes/ && \
git clone https://github.com/molivier/nest.git

cd ~ && \
git clone https://github.com/barrysteyn/pelican_plugin-render_math.git

# Set up a few things
mkdir -p ${HOME}/bin
mkdir -p /mnt/Programming

# Add user to group vboxsf to get access to auto-mounted shared folders
usermod -a -G vboxsf $(whoami)
