
# Get the template Vagrantfile
[ -f ./Vagrantfile ] || curl -O https://raw.githubusercontent.com/0x7df/mkvm/master/Vagrantfile

# Vagrant up
vagrant up