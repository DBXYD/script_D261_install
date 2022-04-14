#!/bin/bash
########################################
## Installation Script	rev 1.0	##
## Rev.0				##
## Date : 14/04/2022			##
## OS : Linux Ubuntu 20.04		##
## Made by Nicolas Papazoglou		##
########################################

## UPDATE ##
sudo apt update -y
sudo apt upgrade -y

## Network Config from yaml file ##
sudo cp 01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml
sudo netplan apply

## Base and graphic drivers INSTALL ##
sudo apt install -y build-essential linux-headers-$(uname -r) libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 software-properties-common
sudo apt install -y nvidia-driver-510

## Install packet ##
sudo apt install -y nfs-common git htop locate apt-transport-https wget vim screen gparted netcat nmap wireshark wakeonlan filezilla texmaker texlive-fonts-extra vlc thunderbird libreoffice audacity chromium-browser octave* geany python3-pip putty gimp keepassxc obs-studio clusterssh openssh-server

pip3 install ipykernel jupyterlab octave_kernel matplotlib scipy 
pip3 install --upgrade numpy 
pip3 install seaborn pandas sklearn datetime
#pip3 install matlab_kernel

## RPI Imager ##
sudo apt install libqt5qml5 qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-templates2 qml-module-qtquick-window2 qml-module-qtgraphicaleffects
wget https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb
sudo dpkg -i imager_latest_amd64.deb
rm imager_latest_amd64.deb

## PyCharm ##
#sudo snap install pycharm-professional --classic
wget https://download-cdn.jetbrains.com/python/pycharm-professional-2022.1.tar.gz
sudo tar xzf pycharm-*.tar.gz -C /opt/
rm pycharm-*.tar.gz 
cd /opt/pycharm-*/bin
sudo sh pycharm.sh
sudo ln -s /opt/pycharm-*/bin/pycharm.sh /usr/bin/pycharm
## add link to desktop

## Arduino INSTALL ##
sudo wget https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz
sudo tar -xvf arduino-*-linux64.tar.xz -C /opt/
sudo rm arduino-*-linux64.tar.xz
sudo sh /opt/arduino-*/install.sh

## MATLAB INSTALL ##
sudo wget https://cloud.ensea.fr/index.php/s/ANg1MxyQBiNGfH3/download
mv download Matlab_R2019b.tar.bz2
sudo mkdir /opt/matlab	
sudo tar -xvf c -C /opt/matlab/
rm Matlab_R2019b.tar.bz2
sudo ln -s /opt/matlab/Matlab_R2019b/bin/matlab /usr/bin/matlab
sudo ln -s /opt/matlab/Matlab_R2019b/bin/matlab /usr/bin/matlab2019

## STM32CubeIDE INSTALL ##
wget https://www.st.com/content/ccc/resource/technical/software/sw_development_suite/group0/13/d4/6b/b0/d2/fd/47/6d/stm32cubeide_deb/files/st-stm32cubeide_1.9.0_12015_20220302_0855_amd64.deb_bundle.sh.zip/jcr:content/translations/en.st-stm32cubeide_1.9.0_12015_20220302_0855_amd64.deb_bundle.sh.zip
unzip en.st-stm32cubeide*.zip 
sudo bash st-stm32cubeide*.sh
rm en.st-stm32cubeide*.zip
rm st-stm32cubeide*.sh

## Sublime Text INSTALL ##
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -y
sudo apt install sublime-text -y

## VirtualBox INSTALL ##
sudo apt install virtualbox virtualbox-guest-additions-iso -y

## Anaconda INSTALL ##
#wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
#sudo bash Anaconda3-2021.05-Linux-x86_64.sh

## VCode INSTALL ##
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

## Kicad INSTALL ##
sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
sudo apt update
sudo apt install --install-recommends kicad

## Eagle INSTALL ##
wget https://trial2.autodesk.com/NET17SWDLD/2017/EGLPRM/ESD/Autodesk_EAGLE_9.6.2_English_Linux_64bit.tar.gz
sudo tar -xvf Autodesk_EAGLE_*.tar.gz -C /opt/
rm Autodesk_EAGLE_*.tar.gz
sudo chown root:root /opt/eagle-*/ -R
sudo chmod +rx /opt/eagle-*/ -R
sudo ln -s /opt/eagle-9.6.2/eagle /usr/bin/eagle-9.6.2
sudo ln -s /opt/eagle-9.6.2/eagle /usr/bin/eagle

## RAJOUT UTILISATEUR ##

sudo reboot
