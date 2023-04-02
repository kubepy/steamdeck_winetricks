if [[ -d /home/deck/.local/share/Steam/steamapps/compatdata/$1/pfx ]] ; then
podman exec -it 'holo' env WINEPREFIX=/home/deck/.local/share/Steam/steamapps/compatdata/$1/pfx wine winecfg
fi
