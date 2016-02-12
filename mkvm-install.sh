
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

# Add user to group vboxsf to get access to auto-mounted shared folders
usermod -a -G vboxsf $(whoami)

