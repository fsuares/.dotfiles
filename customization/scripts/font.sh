#!/bin/bash

install_fonts(){
	mkdir $HOME/.local/share/fonts
	cp -r ./.dotfiles/fonts/* $HOME/.local/share/fonts
}

export install_fonts