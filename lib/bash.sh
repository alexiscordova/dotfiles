#!/bin/bash

###############################################################################
# Nano                                                                        #
###############################################################################

# Install nanorc
echo '📦 Installing nanorc…'
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

## Configure nanorc
echo 'Configuring nanorc…'
printf '\n' >> ~/.nanorc
printf 'set softwrap\n' >> ~/.nanorc
printf 'set tabsize 2\n' >> ~/.nanorc
printf 'set tabstospaces\n' >> ~/.nanorc
