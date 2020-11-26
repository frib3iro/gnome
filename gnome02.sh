#!/usr/bin/env bash

# Atualizar 
echo "Atualizando..."
sudo pacman -Syu
sleep 2
clear

# Em seguida, instale o X Window System (xorg)
echo "Instalando o X Window System (xorg)"
sudo pacman -S xorg xorg-server
sleep 2
clear

# Instale o ambiente GNOME Desktop
echo "Instalando o ambiente GNOME Desktop"
sudo pacman -S gnome gnome-extra gnome-tweak-tool
sleep 2
clear

# Inicie e ative o serviço gdm
echo "Iniciando e ativando o serviço gdm"
sudo systemctl start gdm.service
sudo systemctl enable gdm.service
sleep 2
clear

# Instale o pacote pulseaudio
echo "Instalando o pacote pulseaudio"
sudo pacman -S pulseaudio pulseaudio-alsa
sleep 2
clear

