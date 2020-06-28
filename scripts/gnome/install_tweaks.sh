#!/usr/bin/env bash

if test "$1" = "--open"; then
	OPEN_INSTEAD=1
	echo asd
fi


function installExtension {
	url="$1"
	if ! test -z "$OPEN_INSTEAD"; then
		echo Opening $url...
		xdg-open "$url"
	else
	    uuid="$(
	        curl -s -L $url |
	        grep data-uuid=\".*\" | sed -e "s/^.*uuid=\"//" |
	        rev | cut -c2- | rev
	    )"

	    echo "installing $uuid from $url.."
	    dbus-send --dest=org.gnome.Shell                       \
	        --print-reply                                      \
	        --type=method_call                                 \
	        /org/gnome/Shell                                   \
	        org.gnome.Shell.Extensions.InstallRemoteExtension  \
	        string:"$uuid"
	    echo
	fi

}

echo

# essential:
installExtension "https://extensions.gnome.org/extension/352/middle-click-to-close-in-overview/" # middleclickclose@paolo.tranquilli.gmail.com
installExtension "https://extensions.gnome.org/extension/949/bottompanel/" # bottompanel@tmoer93
installExtension "https://extensions.gnome.org/extension/545/hide-top-bar/" # hidetopbar@mathieu.bidon.ca
installExtension "https://extensions.gnome.org/extension/234/steal-my-focus/"
installExtension "https://extensions.gnome.org/extension/1236/noannoyance/"
installExtension "https://extensions.gnome.org/extension/1326/block-caribou/" # cariboublocker@git.keringar.xyz
installExtension "https://extensions.gnome.org/extension/28/gtile/"

# neat
installExtension "https://extensions.gnome.org/extension/905/refresh-wifi-connections/"
installExtension "https://extensions.gnome.org/extension/1276/night-light-slider/"
installExtension "https://extensions.gnome.org/extension/959/disable-workspace-switcher-popup/" # disable-workspace-switcher-popup@github.com
installExtension "https://extensions.gnome.org/extension/744/hide-activities-button/" # Hide_Activities@shay.shayel.org
installExtension "https://extensions.gnome.org/extension/1097/keep-awake/" # KeepAwake@jepfa.de
installExtension "https://extensions.gnome.org/extension/708/panel-osd/" # panel-osd@berend.de.schouwer.gmail.com
installExtension "https://extensions.gnome.org/extension/1297/remove-dash/" # Remove_Dash@localhost.localdomain
installExtension "https://extensions.gnome.org/extension/906/sound-output-device-chooser/" # sound-output-device-chooser@kgshank.net
installExtension "https://extensions.gnome.org/extension/1031/topicons/" # TopIcons@phocean.net
installExtension "https://extensions.gnome.org/extension/1289/window-animations/" # window-animations@rliang.github.com
