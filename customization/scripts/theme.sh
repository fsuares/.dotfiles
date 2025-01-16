#!/bin/bash

install_gtk_theme_tokyo_night(){
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


install_gtk_theme(){
	git clone https://github.com/vinceliuice/Colloid-gtk-theme.git

	./Colloid-gtk-theme/install.sh --tweaks float --libadwaita -s compact
	sudo rm -rf Colloid-gtk-theme

	sudo cp -r $HOME/.themes/* /usr/share/themes

	gsettings set org.gnome.desktop.interface gtk-theme "Colloid-Dark-Compact"
	gsettings set org.gnome.desktop.wm.preferences theme "Colloid-Dark-Compact"

	# Setting theme icons to flatpak apps
	sudo flatpak override --filesystem=$HOME/.themes
	sudo flatpak override --filesystem=$HOME/.icons
	flatpak override --user --filesystem=xdg-config/gtk-4.0
	sudo flatpak override --filesystem=xdg-config/gtk-4.0
}

change_wallpaper(){
	sudo cp -r ./.dotfiles/wallpapers /usr/share/backgrounds/
	gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/wallpapers/58.jpg
	gsettings set org.gnome.desktop.background picture-uri-dark file:///usr/share/backgrounds/wallpapers/58.jpg
}

export change_wallpaper
export install_gtk_theme
