#!/bin/bash

install_gtk_theme(){
	git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.git

	./Tokyonight-GTK-Theme/themes/install.sh --libadwaita -t purple -c dark -s compact --tweaks black
	sudo rm -rf Tokyonight-GTK-Theme

	sudo cp -r $HOME/.themes/* /usr/share/themes

	gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Purple-Dark-Compact"
	gsettings set org.gnome.desktop.wm.preferences theme "Tokyonight-Purple-Dark-Compact"

	# Setting theme icons to flatpak apps
	sudo flatpak override --filesystem=$HOME/.themes
	sudo flatpak override --filesystem=$HOME/.icons
	flatpak override --user --filesystem=xdg-config/gtk-4.0
	sudo flatpak override --filesystem=xdg-config/gtk-4.0
}
export install_gtk_theme
