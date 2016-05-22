#!/bin/bash
#
# Standard .bashrc and Python startup
[ -s "${HOME}"/.bashrc ] || cp ./.bashrc_template "${HOME}"/.bashrc

# Check for PYTHONSTARTUP
grep "export PYTHONSTARTUP" "${HOME}"/.bashrc > /dev/null 2>&1
if [ "$?" -ne 0 ] ; then
    {
        echo ""
        echo "# Set Python startup file in PYTHONSTARTUP environment variable"
        echo "export PYTHONSTARTUP=\"/home/x7df/.pythonrc.py\""
    } >> "${HOME}"/.bashrc
fi

# Put the .pythonrc.py file in the right place 
[ -s "${HOME}"/.pythonrc.py ] || cp ./.pythonrc.py_template "${HOME}"/.pythonrc.py

# Put the .gitconfig file in the right place and open it up for editing
[ -s "${HOME}"/.gitconfig ] && mv "${HOME}"/.gitconfig ./.gitconfig_backup
cp ./.gitconfig_template "${HOME}"/.gitconfig

[ -s "${HOME}"/.gitignore_global ] && mv "${HOME}"/.gitignore_global ./.gitignore_global_backup
cp ./.gitignore_global "${HOME}"/.gitignore_global

# Put the .vimrc file in the right place
[ -s "${HOME}"/.vimrc ] || cp ./.vimrc_template "${HOME}"/.vimrc

# Add the Nest theme for Pelican
cd /usr/local/lib/python2.7/dist-packages/pelican/themes/ && \
git clone https://github.com/molivier/nest.git

cd ~ && \
git clone https://github.com/barrysteyn/pelican_plugin-render_math.git

# Set up a few things
mkdir -p "${HOME}"/bin
mkdir -p /mnt/Programming

