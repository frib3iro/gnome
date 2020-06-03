#!/usr/bin/env bash

# variaveis
pass_user='cp1113bug6u'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
seta='\e[32;1m==>\e[m'

# Funções ------------------------------------------------------------
driver_virtmanager(){
    echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
}

driver_nvidia(){
    echo $pass_user | sudo -S pacman -S nvidia nvidia-utils nvidia-settings intel-ucode --noconfirm
}
# GDM ----------------------------------------------------------------
instalar_gdm(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
}
iniciar_gdm(){
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

# Tela de boas vindas
clear
echo -e "${seta} ${blue}Bem vindo a terceira parte da instalação!${end}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${blue}Atualizando...${end}"
echo $pass_user | sudo -S pacman -Syu --noconfirm
sleep 2s
clear

echo -en "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o driver virt-manager ou${end} ${red}[ 2 ]${end} ${blue}para instalar o driver nvidia:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para virt-manager${end}"
    driver_virtmanager
    sleep 2s
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para nvidia${end}"
    driver_nvidia
    sleep 2s
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi

echo -e "${seta} ${blue}Instalando o cinnamon desktop${end}"
echo $pass_user | sudo -S pacman -S gnome --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o ${end}"
echo $pass_user | sudo -S pacman -S --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando pacotes necessários${end}"
echo $pass_user | sudo -S pacman -S accountsservice alsa-utils archlinux-keyring archlinux-wallpaper baobab bash-completion blueberry bluez bluez-cups bluez-tools bolt cmatrix colord coreutils cpio cronie dialog ffmpegthumbnailer gimp gnome-bluetooth gedit gnome-calculator gnome-calendar gnome-disk-utility gnome-keyring gnome-menus gnome-online-accounts gnome-power-manager gnome-screenshot gnome-settings-daemon gnome-system-monitor gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lollypop man-db metacity mtools neofetch pass rsync system-config-printer tcpdump totem ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip xreader youtube-dl --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o yay${end}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o gnome-terminal-transparency${end}"
yay -S gnome-terminal-transparency --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando os${end} ${yellow}firmwares warnigs${end} ${blue}do archlinux${end}"
yay -S aic94xx-firmware wd719x-firmware --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o mint-icons${end}"
yay -S mint-y-icons --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Instalando o google-chrome${end}"
yay -S google-chrome --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando o xdg-update${end}"
xdg-user-dirs-update
sleep 2s

echo -e "${seta} ${blue}Instalando o gdm${end}"
instalar_gdm 
sleep 2s
clear

echo -e "${seta} ${blue}Iniciando o serviço do gdm${end}"
iniciar_gdm
sleep 2s
clear
