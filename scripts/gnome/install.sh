#!/usr/bin/env bash

sudo bash -c ":" || exit 1 # ensure sudo
DIR=$(git rev-parse --show-toplevel)

function install_arch {
    #todo verify it IS arch
    if ! ( pacman -Qi $1 ) > /dev/null; then
        echo installing $1...
        sudo pacman --noconfirm -S $1
    else
        echo omitting installing $1...
        false
    fi
}

function install_ubuntu {
	# todo verify if it IS ubuntu
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


#install_arch pacaur

function installaur {
	if (command -v pamac >/dev/null); then
        pamac build --no-confirm "$@"
	#if (which pacaur 2>&1 > /dev/null); then
	#    if ! pacman -Qi $1 > /dev/null; then
	#        echo installing $1...
	#        #sudo pacaur --noconfirm -S $1
	#        VISUAL=echo pacaur --noconfirm -S $1
	#    else
	#        echo omitting installing $1...
	#    fi
	else
		echo pamac not installed, unable to install $@
    fi
}

function installppa {
	repository="$1"
	packages="$@"


}

read -p "Install gnome extensions?  (y/N)?" DO
if [ "$DO" = "y" ]; then
	(
		install gnome-shell-extensions # yes, needed
		cd "$DIR/script/gnome"
		./install_tweaks.sh

		# push gnome dconf config
		cd "$DIR/config/dconf"
		./push.sh extension_*.ini
	)
fi

install yad

install xorg-xauth
install xorg-xprop
install wmctrl
install xdotool
install dconf-editor
install xclip
install_arch xorg-xrandr
install_ubuntu x11-xserver-utils
install wl-clipboard
#install adwaita-icon-theme


install bluez-utils

#installaur gnome-terminal-transparency # failing?

(
	# install theme
	cd "$DIR/scripts/gnome"
	./install_theme.sh

	# push gnome dconf config
	cd "$DIR/config/dconf"
	./push.sh theme.ini
)
(
	# push gnome dconf config
	cd "$DIR/config/dconf"
	./push.sh behaviour.ini shortcuts.ini evince.ini
)
(
	# install .local/opt and .local/bin/xterminal symlinks
	cd "$DIR/scripts/symlinks"
	./opt
	./xterminal
)
