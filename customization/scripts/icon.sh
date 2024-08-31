#!/bin/bash

install_cursor(){
	wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz
	tar -xvf Bibata-Modern-Ice.tar.xz
	rm Bibata-Modern-Ice.tar.xz
	
	sudo mv Bibata-* /usr/share/icons/
	
	gsettings set  org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
}

install_icons(){
	git clone https://github.com/vinceliuice/Colloid-icon-theme.git
	./Colloid-icon-theme/install.sh -s catppuccin -t purple
	
	sudo cp -r $HOME/.local/share/icons/* /usr/share/icons
	sudo cp -r $HOME/.local/share/icons/* $HOME/.icons
	rm -rf Colloid-icon-theme
	
	gsettings set  org.gnome.desktop.interface icon-theme 'Colloid-Purple-Catppuccin-Dark'
}

export install_icons
export install_cursor