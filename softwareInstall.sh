# Author : Sarath P S
# Digital Signature Software Installation Process Autumation

#!/bin/bash
echo "Your current working directory $PWD "
mkdir $HOME/DscSoftware
sudo apt install default-jre -y
echo "java download completed"
sleep 5
curl -o $HOME/DscSoftware/proxkey_ubantu.deb https://www.support.cryptoplanet.in/DownloadFiles/proxkey_ubantu.deb
echo "proxkey_ubuntu token tool download completed"
sleep 5
curl -o $HOME/DscSoftware/NICDSign.deb https://bims.treasury.kerala.gov.in/treasury/dsc/NICDSign.deb
echo "NICDsign download completed"
sleep 5
