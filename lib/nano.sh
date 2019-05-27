#!/bin/bash

###############################################################################
# Nano                                                                        #
###############################################################################

# Install nanorc
echo '📦 Installing nanorc'
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

## Configure nanorc
echo 'Configuring nanorc'
printf '\n' >> .nanorc
printf 'set softwrap' >> .nanorc
printf 'set tabsize 2' >> .nanorc
printf 'set tabstospaces' >> .nanorc
