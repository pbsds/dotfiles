#!/usr/bin/env bash

pamac install --no-confirm vimix-gtk-themes
pamac install --no-confirm flat-remix # icons

exit 0 # aur has it

# todo: move these installer functions into a separate include file
# todo: update instead of reinstall?
# todo: detect install and stop

function install_arch {
    if ! ( pacman -Qi $1 ) > /dev/null; then
        echo installing $1...
        sudo pacman --noconfirm -S $1
    else
        echo omitting installing $1...
        false
    fi
}

function install_ubuntu {
	#tries both apt and snap
    if ( snap info $1 >/dev/null 2>&1 ); then
    	echo installing $1...
    	sudo snap install $1
    elif ( apt-cache show $1 >/dev/null 2>&1 ); then
        echo installing $1...
        sudo apt-get install -y $1
    else
        echo ERROR: unable to find package $1...
        false
    fi
}

function install {
	# todo move this to seperate dependancy which all files can depend on
	# support more than arch
	if ( which pacman  >/dev/null 2>&1 ); then
		install_arch "$@"
	elif ( which apt > /dev/null 2>&1 ); then
		install_ubuntu "$@"
	fi
}


install git
install_ubuntu gtk2-engines-murrine
install_ubuntu gtk2-engines-pixbuf
install_arch gtk-engine-murrine
install_arch gtk-engines

# todo, switch to using pamac?
# todo, find something to use aur on other distros

(
	mkdir -p ~/.local/tmp
	cd ~/.local/tmp

	# add as submodule instead?
	git clone https://github.com/vinceliuice/vimix-gtk-themes.git
	cd vimix-gtk-themes
	./Install --theme ruby
	cd ..
	rm -rf vimix-gtk-themes
)


