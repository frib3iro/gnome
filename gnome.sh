#!/usr/bin/env bash

#----------------------------------------------------------------------
# Script    : [gnome.sh]
# Descrição : Script para instalação do gnome e apps nescessários
# Versão    : 1.0
# Autor     : Fabio Junior Ribeiro <rib3iro@live.com>
# Data      : 11/12/2020
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       : ./gnome
#----------------------------------------------------------------------

clear
source funcoes.sh
source variaveis.sh

# Tela de boas vindas
clear
echo -e "${S}${C}Bem vindo a instalação do gnome${F}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${S}${C}Atualizando...${F}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

# Instalando pacotes
echo -e "${S}${C}Instalando pacotes necessários${F}"
sleep 2s
echo $pass_user | sudo -S pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor gnome-sound-recorder grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit gedit-plugins gimp gnome gnome-keyring gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mesa-demos mtools neofetch neovim os-prober pass rsync speedtest-cli totem ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth lollypop kid3-cli --noconfirm
clear

# Desinstalando pacotes
echo -e "${S}${R}Desinstalando pacotes desnecessários${F}"
sleep 2s
echo $pass_user | sudo -S pacman -R epiphany malcontent gnome-books gnome-maps gnome-boxes gnome-contacts gnome-music gnome-software gnome-terminal --noconfirm
clear

# YAY
echo -e "${S}${C}Instalando o yay${F}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Mintstick
echo -e "${S}${C}Instalando o Mintstick${F}"
sleep 2s
yay -S mintstick --noconfirm
clear

# Downgrade
echo -e "${S}${C}Instalando o downgrade${F}"
sleep 2s
yay -S downgrade --noconfirm
clear

# Timeshift
echo -e "${S}${C}Instalando o timeshift${F}"
sleep 2s
yay -S timeshift --noconfirm
clear

# Hackerman
echo -e "${S}${C}Instalando Pacotes Hacker${F}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump wifite --noconfirm
yay -S crunch --noconfirm
clear

# Firmwares
echo -e "${S}${C}Instalando os${F} ${Y}firmwares warnigs${F} ${C}do archlinux${F}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Gnome-terminal-transparency
echo -e "${S}${C}Instalando o gnome-terminal-transparency${F}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

# Cava
echo -e "${S}${C}Instalando o cava${F}"
sleep 2s
yay -S cava --noconfirm
clear

# Ventoy
echo -e "${S}${C}Instalando o ventoy${F}"
sleep 2s
yay -S ventoy-bin --noconfirm
clear

# Mint-icons
echo -e "${S}${C}Instalando o mint-icons${F}"
sleep 2s
yay -S mint-y-icons --noconfirm
clear

# Sardi-icons
echo -e "${S}${C}Instalando o sardi-icons${F}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Ant-dracula-theme-git
echo -e "${S}${C}Instalando o ant-dracula-theme-git${F}"
sleep 2s
yay -S ant-dracula-theme-git --noconfirm
clear

# Debtap
echo -e "${S}${C}Instalando o debtap${F}"
sleep 2s
yay -S debtap --noconfirm
clear

# Google-chrome
echo -e "${S}${C}Instalando o google-chrome${F}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Fontes
echo -e "${S}${C}Instalando as fontes${F}"
sleep 2s
echo $pass_user | sudo -S pacman -S ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

# Tema dracula no gedit
echo -e "${S}${C}Baixando e instalando o tema Dracula no gedit${F}"
sleep 2
TemaDraculaGedit
clear

# Menu para escolha do driver de vídeo
echo -e "${S}${C}Instalando Drivers de Vídeo${F}"
echo
echo -e "${S}${C}[ 1 ] Instalar drivers Nvidia${F}"
echo -e "${S}${C}[ 2 ] Instalar driver VirtManager${F}"
echo
echo -en "${S}${Y}Digite a opção desejada: ${F}"
read opcao
case $opcao in
    1) NvidiaDriver ;;
    2) VirtManagerDriver ;;
    *) echo "${S}${R}O sistema será instalado sem os drivers!${F}"
esac

# Instalando o virt-manager
VirtManager

# xdg-user-dirs
echo -e "${S}${C}Iniciando o xdg-update${F}"
sleep 2s
xdg-user-dirs-update
clear

# Bluez
echo -e "${S}${C}Iniciando o bluez${F}"
sleep 2s
Bluez
clear

# Gnome Display Manager
echo -e "${S}${C}Instalando o Gnome Display Manager${F}"
sleep 2s
GnomeDisplayManager
clear

