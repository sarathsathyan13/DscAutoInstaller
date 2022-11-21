# Author : Sarath P S
# Digital Signature Software Installation Process Autumation

#!/bin/bash
dskeys=(PROXKEY)
token=$(zenity --entry --title "Digital Signature" --entry-text "${dskeys[@]}" --text "Select OK")

if [ $(dpkg-query -W -f='${Status}' nicdsign 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
	sudo apt-get purge --force-yes -y nicdsign
	sudo rm -rf $HOME/.config/autostart/DSCService.desktop
	sudo rm -rf $HOME/Desktop/NICDSign.desktop
	sudo rm -rf /opt/nic/NICDSign/jre
fi

if [ $token = "PROXKEY" ]; then

	sudo dpkg -i $HOME/Downloads/proxkey_ubantu.deb
	sudo dpkg -i $HOME/Downloads/NICDSign.deb
	mkdir -p $HOME/Documents
	cp -r /usr/local/DSign/ssl $HOME/Documents/
	mkdir -p $HOME/.config/autostart

  if [ ! -f $HOME/.config/autostart/DSCService.desktop ]; then
    if [ -f /opt/nic/NICDSign/DSCService.desktop ]; then
			cp /opt/nic/NICDSign/DSCService.desktop $HOME/.config/autostart/
		fi
	fi

	(zenity --title "Digital Signature" --info --text "Remove the token and restart Computer")
	sleep 5
reboot
else
	(zenity --title "Digital Signature" --error --text "No valid token selected")
fi
