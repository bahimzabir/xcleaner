#!/bin/bash
# by: Abderrahim Zabir
# login: azabir 

total_savings=0

echo -e "Cleaning...\n"


cache_directories=(
    #You can add any files you want to clean in here :-)
    $HOME/.var/app/com.google.Chrome/cache/
    $HOME/.npm/_cacache/
    $HOME/.bun/install/cache/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/component_crx_cache/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/extensions_crx_cache/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/Default/Service\ Worker/ScriptCache/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/Default/File\ System/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/Default/Service\ Worker/CacheStorage/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/Profile\ [0-9]/Service\ Worker/ScriptCache/
    $HOME/.var/app/com.google.Chrome/config/google-chrome/Profile\ [0-9]/File\ System/
    $HOME/.var/app/com.spotify.Client/cache/
    $HOME/.var/app/com.visualstudio.code/cache/
    $HOME/.var/app/com.visualstudio.code/config/Code/Cache/
    $HOME/.var/app/com.visualstudio.code/config/Code/CachedData/
    $HOME/.var/app/com.visualstudio.code/config/Code/CachedExtensionVSIXs/
    $HOME/.var/app/com.discordapp.Discord/config/discord/Cache/
    $HOME/.var/app/com.discordapp.Discord/cache/
    $HOME/.var/app/org.mozilla.firefox/cache/
    $HOME/.var/app/*/cache/
    $HOME/.local/share/Trash/
    $HOME/.cache/
)


for dir in "${cache_directories[@]}"; do
    dir_size=$(du -sk "$dir" 2>/dev/null | awk '{print $1}')

    # Check if dir_size is a valid number
        rm -rf "$dir"/* &>/dev/null
        if [ $? -eq 0 ]; then
            echo -ne "\r\033[K\033[32mFiles in: $dir: $dir_size KB cleaned"
            total_savings=$((total_savings + dir_size))
        fi
    # else
    #     echo -ne "\r\033[K\033[31mUnable to calculate size for directory $dir\033[0m"
    sleep 0.05
done


echo -e "\n\nDone\n\033[0m"

if [ "$total_savings" -lt 1000 ]; then
    echo -e "Total estimated memory savings: \033[32m$total_savings KB\033[0m"
else
    echo -e "Total estimated memory savings: \033[32m$((total_savings / 1000)) MB\033[0m"
fi


echo -e	"\npull_requests/issues goes in here:"
echo -e	"GitHub   ~> \033[4;1;34\ https://github.com/bahimzabir/xcleaner/\033[0m"
echo -e	"\ngive it a star :-)\n"
