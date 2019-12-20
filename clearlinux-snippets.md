Clear linux
===========

Update chrome
-------------

```bash

#!/bin/bash

clear

divider="==============================\n"
latest=$(curl -s https://omahaproxy.appspot.com/linux)
current=$(/opt/google/chrome/google-chrome --version | cut -c15-)

printf "$divider  \033[1mGoogle Chrome Update Check\033[0m\n$divider"
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
      curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;
      printf "\n\033[1mUpdating:\033[0m\n\n";
      sudo rpm -U --nodeps google-chrome*.rpm;
      rm -f google-chrome*.rpm;
      printf "\n\033[1m\e[32mGoogle Chrome has been updated.\033[0m\n";;
    * )
      printf "\n\n\033[1m\e[31mPlease update soon!!!\033[0m\n";;
  esac
fi
printf "\n"
echo Press a key...
read -n1

```

and a update_chrome.desktop in ~/.local/share/applications

```

[Desktop Entry]
Type=Application
Name=update-chrome
Exec=/home/tord/.local/bin/update-chrome.sh
StartupNotify=false
Terminal=true

```
