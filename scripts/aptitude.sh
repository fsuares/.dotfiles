#!/bin/bash

RED='\e[1;91m'
GREEN='\e[1;92m'
BLUE='\e[1;94m'
ORANGE='\e[1;93m'
NO_COLOR='\e[0m'

remove_unused_apps(){
	APPS=(
		'firefox'
		'libreoffice'
		'libreoffice-math'
		'libreoffice-writer'
		'libreoffice-draw'
		'libreoffice-impress'
		'libreoffice-calc'
		'geary'
		'gnome-contacts'
		'gedit'
	)
	for APP in ${APPS[@]}; do
		if dpkg -l | grep -q $APP; then # Só instala se já não estiver instalado
		  sudo apt remove "$APP" -y
		  echo -e "${GREEN}[SUCESS] - Uninstalled $APP ${NO_COLOR}"
		else
		  echo -e "${ORANGE}[NOT INSTALED] - $APP ${NO_COLOR}"
		fi
	done
	sleep 1
	echo
	echo
}

upgrade_cleanup () {
  echo -e "[INFO] - Performing upgrade and cleanup..."
  sleep 1
  sudo rm -rf /var/lib/dpkg/lock
  sudo rm -rf /var/lib/dpkg/lock-frontend
  sudo rm -rf /var/cache/apt/archives/lock
  sudo apt autoclean
  sudo apt clean
  sudo apt update -m
  sudo dpkg --configure -a
  sudo apt install -f
  sudo apt full-upgrade
  sudo apt autoremove -y
  sleep 1
	echo
	echo
}

install_deb_apps(){
  DEB_PKGS=(
  	'wget'
  	'git'
  	'curl'
  	'bashtop'
  	'zsh'
  	'exa'
  	'xclip'
  	'vlc'
  	'gnome-sushi'
  	'folder-color'
  	'dconf-cli'
  	'bat'
  	'gparted'
  	'gnome-tweaks'
  	'libffi-dev'
  	'libncurses5-dev'
  	'zlib1g'
  	'zlib1g-dev'
  	'libssl-dev'
  	'libreadline-dev'
  	'libbz2-dev'
  	'libsqlite3-dev'
	'gtk2-engines-murrine'
  )
  
	for PKG in ${DEB_PKGS[@]}; do
		if ! dpkg -l | grep -q $PKG; then
		  sudo apt install "$PKG" -y
		  echo -e "${GREEN}[SUCESS]"
		else
		  echo -e "${ORANGE}[INSTALED] - $PKG"
		fi
	done
	sleep 1
	echo
	echo
}

export install_deb_apps
export upgrade_cleanup
export remove_unused_apps

