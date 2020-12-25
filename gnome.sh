#!/usr/bin/env bash

#----------------------------------------------------------------------
# Script 	: [gnome.sh]
# Descrição	: Script para instalação do gnome e apps nescessários
# Versão 	: 1.0
# Autor 	: Fabio Junior Ribeiro <rib3iro@live.com>
# Data 		: 11/12/2020
# Licença 	: GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso		: ./gnome
#----------------------------------------------------------------------
# variaveis
# Password root/user
user='fabio'
pass_user='123'
# Cores usadas no script
R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
# Fechamento das cores no script
F='\033[0m'
# Seta utilizada no inicio das frases
S='\e[32;1m>>>\e[m'
#----------------------------------------------------------------------

clear
# Tela de boas vindas
echo -e "${S} ${C}Bem vindo a instalação do gnome${F}"
sleep 2s

# Atualizando os espelhos
echo
echo -e "${S} ${C}Atualizando...${F}"
sleep 2s
if echo $pass_user | sudo -S pacman -Syu --noconfirm
then
	echo "${S} ${G}Sucesso${F}"
else
	echo "${S} ${R}falhou${F}"
fi

# Instalando pacotes
echo
echo -e "${S} ${C}Instalando pacotes necessários${F}"
sleep 2s
if echo $pass_user | sudo -S pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor gnome-sound-recorder grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit gedit-plugins gimp gnome gnome-keyring gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mesa-demos mtools neofetch os-prober pass mrlint rsync speedtest-cli totem ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth lollypop --noconfirm
then
	echo "${S} ${G}Sucesso${F}"
else
	echo "${S} ${R}falhou${F}"
fi

# Desinstalando pacotes
echo
echo -e "${S} ${R}Desinstalando pacotes desnecessários${F}"
sleep 2s
if echo $pass_user | sudo -S pacman -R epiphany gnome-books gnome-maps gnome-boxes gnome-contacts gnome-music gnome-terminal --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# YAY
echo
echo -e "${S} ${C}Instalando o yay${F}"
sleep 2s
if git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Mintstick
echo
echo -e "${S} ${C}Instalando o Mintstick${F}"
sleep 2s
if yay -S mintstick --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Downgrade
echo
echo -e "${S} ${C}Instalando o downgrade${F}"
sleep 2s
if yay -S downgrade --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Timeshift
echo
echo -e "${S} ${C}Instalando o timeshift${F}"
sleep 2s
if yay -S timeshift --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Hackerman
echo
echo -e "${S} ${C}Instalando Pacotes Hacker${F}"
sleep 2s
if echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump wifite --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Hackerman
echo
echo -e "${S} ${C}Instalando o crunch${F}"
if yay -S crunch --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Firmwares
echo
echo -e "${S} ${C}Instalando os${F} ${Y}firmwares warnigs${F} ${C}do archlinux${F}"
sleep 2s
if yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Gnome-terminal-transparency
echo
echo -e "${S} ${C}Instalando o gnome-terminal-transparency${F}"
sleep 2s
if yay -S gnome-terminal-transparency --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Cava
echo
echo -e "${S} ${C}Instalando o cava${F}"
sleep 2s
if yay -S cava --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Ventoy
echo
echo -e "${S} ${C}Instalando o ventoy${F}"
sleep 2s
if yay -S ventoy-bin --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Sardi-icons
echo
echo -e "${S} ${C}Instalando o sardi-icons${F}"
sleep 2s
if yay -S sardi-icons --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Ant-dracula-theme-git
echo
echo -e "${S} ${C}Instalando o ant-dracula-theme-git${F}"
sleep 2s
if yay -S ant-dracula-theme-git --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Debtap
echo
echo -e "${S} ${C}Instalando o debtap${F}"
sleep 2s
if yay -S debtap --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Google-chrome
echo
echo -e "${S} ${C}Instalando o google-chrome${F}"
sleep 2s
if yay -S google-chrome --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Fontes
echo
echo -e "${S} ${C}Instalando as fontes${F}"
sleep 2s
if echo $pass_user | sudo -S pacman -S ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

# Fontes
echo
echo -e "${S} ${C}Instalando as fontes Roboto e Ubuntu${F}"
if yay -S ttf-ms-fonts ttf-roboto ttf-ubuntu-font-family --noconfirm
then
	echo"${S} ${G}Sucesso!${F}"
else
	echo"${S} ${R}Falhou!${F}"
fi

