#!/bin/bash
cat <<'EOF' > .dockerfile.holo
FROM holo-base
RUN pacman -Syy
RUN pacman -S --noconfirm winetricks zenity
RUN rm -rf /var/cache/pacman/pkg/*
EOF
podman build -t holo -f .dockerfile.holo .
