#!/bin/bash
# installer

xcleaner_script="xclean.sh"

chmod +x "$xcleaner_script"

cp "$xcleaner_script" "$HOME/"

default_shell=$(basename "$SHELL")

if [ "$default_shell" = "bash" ] || [ "$default_shell" = "zsh" ]; then
    echo 'alias xclean="/bin/bash $HOME/xclean.sh"' >> "$HOME/.bashrc"
    echo 'alias xclean="/bin/bash $HOME/xclean.sh"' >> "$HOME/.zshrc"
    echo -e "\033[K\033[32m\n\nAlias 'xclean' has been added to your shell configuration."
else
    echo "Unknown shell '$default_shell'. You might need to add the alias manually to your shell configuration."
fi

echo -e "\nTo use the 'xclean' , Please restart your terminal then run 'xclean'\033[0m"



