#!/bin/bash
podman pull ghcr.io/steamdeckhomebrew/holo-base:latest
cat <<'EOF' > .dockerfile.holo-base
FROM ghcr.io/steamdeckhomebrew/holo-base:latest
RUN echo 'Server = https://steamdeck-packages.steamos.cloud/archlinux-mirror/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN sed -i 's|^\(\[core\]\)|[jupiter]\nInclude = /etc/pacman.d/mirrorlist\nSigLevel = Never\n\n[holo]\nInclude = /etc/pacman.d/mirrorlist\nSigLevel = Never\n\n\1|' /etc/pacman.conf
RUN pacman -Syy
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -S --noconfirm holo-keyring
RUN pacman -Rdd --noconfirm libverto
RUN pacman -Qqn | pacman -S --noconfirm --overwrite='*' -
RUN pacman -S --noconfirm --needed base-devel git sudo
RUN useradd -m deck
RUN echo 'deck ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/deck
RUN rm -rf /var/cache/pacman/pkg/*
EOF
podman build -t holo-base -f .dockerfile.holo-base .
