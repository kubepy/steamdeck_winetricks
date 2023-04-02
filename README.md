# steamdeck_winetricks
steamdeck use podman for setting up the 'wine winecfg' or 'winetricks'

Download `podman` command.
```
./get-podman.sh
alias podman='/home/deck/podman-4.2.1-r1-x86_64.AppImage'
```

Append `vim ~/.bashrc`.
```
alias podman='/home/deck/podman-4.2.1-r1-x86_64.AppImage'
if command -v xhost >/dev/null 2>&1; then
  xhost +si:localuser:$USER
fi
```

build the holo-base and holo images for installing winetricks.
```
source ~/.bashrc
podman
./build-holo-base.sh
./build-holo.sh
```

Bring up your holo container.
```
./create-holo.sh
```

$1 as compatdata ID
```
./winecfg.sh 2058180
./winetricks.sh 2058180
```
