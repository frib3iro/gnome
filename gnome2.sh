#!/usr/bin/env bash

clear
source variaveis.sh

# Funções ------------------------------------------------------------
virtmanager(){
    echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
}

nvidia(){
    clear
    echo -e "${seta} ${ciano}Instalando o driver da nvidia${fim}"
    echo $pass_user | sudo -S pacman -S nvidia-utils nvidia-settings intel-ucode --noconfirm
    echo -e "${seta} ${ciano}Wayland e o driver proprietário da NVIDIA${fim}"
    echo $pass_user | sudo -S  ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
    sleep 3s
    clear
}

gdm(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

bluez(){
    echo $pass_user | sudo -S systemctl status bluetooth
    echo $pass_user | sudo -S systemctl enable bluetooth
    echo $pass_user | sudo -S systemctl start bluetooth
    echo $pass_user | sudo -S systemctl enable org.cups.cupsd
}

# Tela de boas vindas
clear
echo -e "${seta} ${ciano}Bem vindo a instalação do gnome${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${ciano}Atualizando...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

echo -e "${seta} ${ciano}Digite${fim} ${vermelho}[ 1 ]${fim} ${ciano}para instalar o driver virt-manager${fim}"
echo -e "${seta} ${ciano}Digite${fim} ${vermelho}[ 2 ]${fim} ${ciano}para instalar o driver nvidia${fim}"
echo -en "\n${seta} ${amarelo}Qual sua resposta:${fim} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${ciano}Iniciando instalação do driver para virt-manager${fim}"
    sleep 2s
    virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${ciano}Iniciando instalação do driver para nvidia${fim}"
    sleep 2s
    nvidia
    clear
else
    echo -e "${seta} ${vermelho}Resposta inválida!${fim}"
    exit 1
fi

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${ciano}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor gnome-sound-recorder grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit gimp gnome gnome-keyring gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mesa-demos mtools neofetch neovim os-prober pass rsync speedtest-cli totem ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth wifite --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
clear

# Desinstalando pacotes -------------------------------------------------
echo -e "${seta} ${vermelho}Desinstalando pacotes desnecessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -R epiphany malcontent gnome-books gnome-maps gnome-boxes gnome-contacts gnome-music gnome-software gnome-terminal --noconfirm
clear

# YAY -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Mintstick ---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o Mintstick${fim}"
sleep 2s
yay -S mintstick --noconfirm
clear

# Downgrade---------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o downgrade${fim}"
sleep 2s
yay -S downgrade --noconfirm
clear

# Timeshift ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o timeshift${fim}"
sleep 2s
yay -S timeshift --noconfirm
clear

# lollypop-stable-git --------------------------------------------------
echo -e "${seta} ${ciano}Instalando o lollypop-stable-git${fim}"
sleep 2s
yay -S lollypop-stable-git kid3-cli --noconfirm
clear

# Hackerman ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump crunch --noconfirm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${ciano}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm
clear

# Gnome-terminal-transparency -------------------------------------------
echo -e "${seta} ${ciano}Instalando o gnome-terminal-transparency${fim}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

# Cava -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o cava${fim}"
sleep 2s
yay -S cava --noconfirm
clear

# Ventoy -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o ventoy${fim}"
sleep 2s
yay -S ventoy-bin --noconfirm
clear

# Mint-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o mint-icons${fim}"
sleep 2s
yay -S mint-y-icons --noconfirm
clear

# Sardi-icons ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o sardi-icons${fim}"
sleep 2s
yay -S sardi-icons --noconfirm
clear

# Ant-dracula-theme-git ------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o ant-dracula-theme-git${fim}"
sleep 2s
yay -S ant-dracula-theme-git --noconfirm
clear

# Debtap ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
clear

# Google-chrome ---------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

# xdg-user-dirs ---------------------------------------------------------
echo -e "${seta} ${ciano}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

# Bluez -----------------------------------------------------------------
echo -e "${seta} ${ciano}Iniciando o bluez${fim}"
sleep 2s
bluez
clear

# GDM -------------------------------------------------------------------
echo -e "${seta} ${ciano}Instalando o gdm${fim}"
sleep 2s
gdm 
clear

