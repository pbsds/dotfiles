# Install or upgrade Chocolatey package manager
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    Write-Output "Chocolatey already installed, upgrading instead."
    choco.exe upgrade -y chocolatey
} else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}


# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoReboot
# Make current user a Hyper-V Administrator to avoid issues with e.g. minikube
net localgroup "Hyper-V Administrators" $env:USERNAME /add


# Associate extensions with given programs
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

# E.g. to associate *.ppk files with PageAnt installed with Chocolatey:
#associate ".7z" "C:\ProgramData\chocolatey\bin\7zFM.exe"
#associate ".rar" "C:\ProgramData\chocolatey\bin\7zFM.exe"


choco install 7zip # TODO: register as default
choco install antimicro
choco install atom # autoit # idea: somehow reuse the atom config for linux
choco install btsync # syncthing # TODO: add the synced repos?
#choco install cemu dolphin
choco install chromium # TODO: change?
choco install cpu-z gpu-z crystaldiskinfo bluescreenview speccy
#choco install drivergenius # needed?
choco install foobar2000 lastfmscrobbler nircmd # TODO: config
choco install git wget # curl
choco install steam goggalaxy
choco install jpegview
choco install winscp # putty
choco install lame flac ffmpeg
#choco install launchy # TODO: config, TODO: needed? http://www.wox.one/
choco install clamav malwarebytes ## TODO: license TODO: needed?
#choco install microsoft-windows-terminal # hyper.is ? or windows terminal? wsltty? alacritty?
choco install mpv youtube-dl # mpv.net instead ?
#choco install opensans # penumbra10
choco install paint.net blender krita gimp obs-studio inkscape # TODO: paint.net plugins
choco install python3 pip
choco install rufus win32diskimager
#choco install sharex # needed? TODO: use in gnome or find alternative?
choco install discord slack hexchat
choco install spotify
choco install teamviewer
choco install transgui
choco install wsl wsl-archlinux vcxsrv
choco install eartrumpet



# TODO: penumbra10: https://www.deviantart.com/scope10/art/Penumbra-10-Windows-10-visual-style-568740374
# TODO: mount reidun
# TODO: paint.net plugins
# TODO: decide on a terminal
# TODO: micro editor
# TODO: DaVinci Resolve
# TODO: https://github.com/wslutilities/wslu
# TODO: find some gnome overview or Expose thingy
# TODO: debloat
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/taskbar-tuning.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/enhance-windows-10-privacy.cmd
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/enable-dark-theme.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-timeline.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-tablet-mode.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-snap.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-start-menu-cortana-and-bing.reg
# TODO: https://github.com/cocreators-ee/aperture-control-recipes/blob/master/recipes/disable-aero-shake.reg
