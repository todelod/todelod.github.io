#!/bin/bash

clear

divider="==============================\n"
latest=$(curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest | jq '.tag_name' | tr -d \")
current=$(codium --version | head -n1 | cut -c1-7)

printf "$divider  \033[1mVSCodium Update Check\033[0m\n$divider"
printf "Latest Version:  $latest\n"
if [ $latest = $current ]
then
  printf "Current Version: $current\n$divider \033[1m\e[32mGoogle Chrome is up to date.\033[0m\n"
else
  printf "Current Version: \033[3m\e[31m$current\033[0m\n$divider  \033[1m\e[31mUPDATE GOOGLE CHROME NOW!!\033[0m\n$divider"
  read -n 1 -r -p "Do you want to update now? (y/n): " response
  case $response in
    [Yy]* )
      printf "\n\n\033[1mDownloading:\033[0m\n\n";
	curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
	| grep -e "https.*codium-.*\.el7\.x86_64\.rpm" \
	| cut -d : -f 2,3 \
	| tr -d \" \
  | head -n1 \
	| wget -qi -

      #curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;
      #printf "\n\033[1mUpdating:\033[0m\n\n";
      sudo rpm -U --nodeps codium*.rpm;

      rm -f codium*.el7.x86_64.rpm;
      printf "\n\033[1m\e[32mVSCodium has been updated.\033[0m\n";;
    * )
      printf "\n\n\033[1m\e[31mPlease update soon!!!\033[0m\n";;
  esac
fi
printf "\n"
echo Press a key...
read -n1
