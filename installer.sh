#!/bin/bash


chmod +x xclean.sh
cp xclean.sh $HOME/

echo 'alias xclean="/bin/bash $HOME/xclean.sh"' >> $HOME/.zshrc
alias xclean="/bin/bash $HOME/xclean.sh"
