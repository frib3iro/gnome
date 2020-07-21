#!/usr/bin/env bash

## variaveis
azul='\e[34;1m'
fim='\e[m'
seta='\e[32;1m-->\e[m'

echo -e "${seta} ${azul}Instalando o tema dracula no gnome terminal${fim}"
sleep 2s
clear
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh && cd /home/fabio
rm -rf gnome-terminal
echo -e "${seta} ${azul}Instalação finalizada${fim}"
