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
echo -e "${seta}${ciano}Bem vindo a instalação do gnome${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta}${ciano}Atualizando...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

# Instalando pacotes
echo -e "${seta}${ciano}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor gnome-sound-recorder grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit gedit-plugins gimp gnome gnome-keyring gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mesa-demos mtools neofetch neovim os-prober pass rsync speedtest-cli totem ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth lollypop kid3-cli --noconfirm
clear

# Desinstalando pacotes
echo -e "${seta}${vermelho}Desinstalando pacotes desnecessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -R epiphany malcontent gnome-books gnome-maps gnome-boxes gnome-contacts gnome-music gnome-software gnome-terminal --noconfirm
clear

# YAY
echo -e "${seta}${ciano}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Mintstick
echo -e "${seta}${ciano}Instalando o Mintstick${fim}"
sleep 2s
yay -S mintstick --noconfirm
clear

# Downgrade
echo -e "${seta}${ciano}Instalando o downgrade${fim}"
sleep 2s
yay -S downgrade --noconfirm
clear

# Timeshift
echo -e "${seta}${ciano}Instalando o timeshift${fim}"
sleep 2s
yay -S timeshift --noconfirm
clear

# Hackerman
echo -e "${seta}${ciano}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump crunch wifite --noconfirm
clear

# Firmwares
echo -e "${seta}${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Gnome-terminal-transparency
echo -e "${seta}${ciano}Instalando o gnome-terminal-transparency${fim}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

# Cava
echo -e "${seta}${ciano}Instalando o cava${fim}"
sleep 2s
yay -S cava --noconfirm
clear

# Ventoy
echo -e "${seta}${ciano}Instalando o ventoy${fim}"
sleep 2s
yay -S ventoy-bin --noconfirm
clear

# Mint-icons
echo -e "${seta}${ciano}Instalando o mint-icons${fim}"
sleep 2s
yay -S mint-y-icons --noconfirm
clear

# Sardi-icons
echo -e "${seta}${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Ant-dracula-theme-git
echo -e "${seta}${ciano}Instalando o ant-dracula-theme-git${fim}"
sleep 2s
yay -S ant-dracula-theme-git --noconfirm
clear

# Debtap
echo -e "${seta}${ciano}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
clear

# Google-chrome
echo -e "${seta}${ciano}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Fontes
echo -e "${seta}${ciano}Instalando as fontes${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

# Tema dracula no gedit
echo -e "${seta}${ciano}Baixando e instalando o tema Dracula no gedit${fim}"
sleep 2
TemaDraculaGedit
clear

# Menu para escolha do driver de vídeo
echo -e "${seta}${ciano}Instalando Drivers de Vídeo${fim}"
echo
echo -e "${seta}${ciano}[ 1 ] Instalar drivers Nvidia${fim}"
echo -e "${seta}${ciano}[ 2 ] Instalar driver VirtManager${fim}"
echo
echo -en "${seta}${amarelo}Digite a opção desejada: ${fim}"
read opcao
case $opcao in
    1) NvidiaDriver ;;
    2) VirtManagerDriver ;;
    *) echo "${seta}${vermelho}O sistema será instalado sem os drivers!${fim}"
esac

# Instalando o virt-manager
VirtManager

# xdg-user-dirs
echo -e "${seta}${ciano}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

# Bluez
echo -e "${seta}${ciano}Iniciando o bluez${fim}"
sleep 2s
Bluez
clear

# Gnome Display Manager
echo -e "${seta}${ciano}Instalando o gdm${fim}"
sleep 2s
GnomeDisplayManager
clear

