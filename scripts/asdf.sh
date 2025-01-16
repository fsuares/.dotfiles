#!/bin/bash

RED='\e[1;91m'
GREEN='\e[1;92m'
BLUE='\e[1;94m'
ORANGE='\e[1;93m'
NO_COLOR='\e[0m'

configure_asdf(){
	PLUGINS=(
		'nodejs'
		'pnpm'
		'bun'
		'yarn'
		'zig'
		'python'
		'rust'
		'elixir'
		'ruby'
	)

	for PLG in ${PLUGINS[@]}; do
		asdf plugin add $PLG
		echo -e "${GREEN}[INSTALED] - $PLG"
	done

	sleep 1

	for PLG in ${PLUGINS[@]}; do
		asdf install $PLG latest
		echo -e "${ORANGE}[LATEST] - $PLG"
	done

	cp ./.dotfiles/.tool-versions $HOME
	echo -e "${ORANGE}[TOOL-VERSIONS] - Copied to home"
	sleep 1
	echo
	echo
}

export configure_asdf
