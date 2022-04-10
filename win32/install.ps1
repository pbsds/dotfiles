# TODO: divide into two channels: VM and full install
# VM only needs the essentials
# Full setup needs stuff like steam and the like

# Install or upgrade Chocolatey package manager
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    Write-Output "Chocolatey already installed, upgrading instead."
    choco.exe upgrade -y chocolatey
} else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# TODO: check if running on VM, decide on WSL and hyperv accordingly


# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoReboot
# Make current user a Hyper-V Administrator to avoid issues with e.g. minikube
net localgroup "Hyper-V Administrators" $env:USERNAME /add


# Helper function to associate extensions with given programs
function associate([string]$extension, [string]$executable) {
    if (-not (Test-Path $executable))
    {
        $errorMessage = "`'$executable`' does not exist, not able to create association"
        throw $errorMessage
    }

    $extension = $extension.trim()
    if (-not ($extension.StartsWith(".")))
    {
        $extension = ".$extension"
    }

    $fileType = Split-Path $executable -leaf
    $fileType = $fileType.Replace(" ", "_")
    $elevated = @"
        cmd /c "assoc $extension=$fileType"
        cmd /c "ftype $fileType=""$executable"" ""%1"" ""%*"""
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
        Set-ItemProperty -Path "HKCR:\$fileType" -Name "(Default)" -Value "$fileType file" -ErrorAction Stop
"@
    Invoke-Expression $elevated
}

# to associate files installed programs installed with with Chocolatey:
choco install -y 7zip
associate ".7z" "C:\ProgramData\chocolatey\bin\7zFM.exe"
associate ".rar" "C:\ProgramData\chocolatey\bin\7zFM.exe"
# TODO: test ^

choco install -y antimicro # TODO: config file, auto start
choco install -y atom # TODO: install config and extentions
#choco install -y autoit
choco install -y btsync # syncthing # TODO: add the synced repos?
#choco install -y cemu dolphin
choco install -y chromium # TODO: change?
choco install -y cpu-z gpu-z crystaldiskinfo bluescreenview speccy
#choco install -y drivergenius # needed?
choco install -y foobar2000 lastfmscrobbler nircmd # TODO: config
choco install -y vb-cable # TODO: update bat file
choco install -y git wget # curl
choco install -y steam goggalaxy
choco install -y jpegview
choco install -y winscp # putty
choco install -y lame flac ffmpeg
choco install -y launchy # TODO: config, TODO: needed? http://www.wox.one/
#choco install -y clamav malwarebytes ## TODO: license TODO: needed?
#choco install -y microsoft-windows-terminal # hyper.is ? or windows terminal? wsltty? alacritty?
choco install -y mpv youtube-dl # mpv.net instead ?
#choco install -y opensans # penumbra10
choco install -y paint.net blender krita gimp obs-studio inkscape # TODO: paint.net plugins
choco install -y python3 pip
choco install -y rufus win32diskimager
#choco install -y sharex # needed? TODO: use in gnome or find alternative?
choco install -y discord slack
#choco install -y hexchat # TODO: setup
choco install -y spotify
choco install -y teamviewer
choco install -y transgui
choco install -y eartrumpet # a nice sound mixer for the taskbar
#choco install -y wsl wsl-archlinux vcxsrv # TODO: setup evince and a decent desktop setup


# TODO: https://rentry.co/fwt : KMS_VL_ALL
# TODO: penumbra10: https://www.deviantart.com/scope10/art/Penumbra-10-Windows-10-visual-style-568740374
# TODO: mount reidun, eg fyrkat
# TODO: paint.net plugins
# TODO: decide on a terminal
# TODO: micro editor
# TODO: DaVinci Resolve
# TODO: https://github.com/wslutilities/wslu
# TODO: setup a Arch WSL2 thing
# TODO: find some gnome overview or Expose thingy
# TODO: winaero?
# TODO: debloat
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/taskbar-tuning.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/enhance-windows-10-privacy.cmd
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/enable-dark-theme.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-timeline.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-tablet-mode.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-snap.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-start-menu-cortana-and-bing.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-aero-shake.reg

# TODO:

# disable alt+shift

# disable capslock

# install penumbra10

# make 'super' open 'task view' with program search enabled
# remove timeline from task view
# classic explorer
# disable sticky keys
# disable 'select application' after snapping window side

# make alt+p into play/pause

# winaero tweaks dotfiles?
