#!/usr/bin/env bash

# variaveis e password
pass_user='123'
azul='\033[0;34m'
verde="\033[0;32m"
vermelho='\033[0;31m'
amarelo='\033[0;32m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Funções ------------------------------------------------------------
virtmanager(){
    echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
}

nvidia(){
    clear
    echo -e "${seta} ${vermelho}O driver da nvidia está em manutenção!${fim}"
    # echo $pass_user | sudo -S pacman -S nvidia nvidia-utils intel-ucode --noconfirm
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
}

# Tela de boas vindas
clear
echo -e "${seta} ${azul}Bem vindo a instalação do gnome${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${azul}Atualizando...${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

echo -e "${seta} ${azul}Digite${fim} ${vermelho}[ 1 ]${fim} ${azl}para instalar o driver virt-manager${fim}"
echo -e "${seta} ${azul}Digite${fim} ${vermelho}[ 2 ]${fim} ${azl}para instalar o driver nvidia${fim}"
echo -en "\n${seta} ${amarelo}Qual sua resposta:${fim} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${azul}Iniciando instalação do driver para virt-manager${fim}"
    sleep 2s
    virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${azul}Iniciando instalação do driver para nvidia${fim}"
    sleep 2s
    nvidia
    clear
else
    echo -e "${seta} ${vermelho}Resposta inválida!${fim}"
    exit 1
fi

# Instalando pacotes ----------------------------------------------------
echo -e "${seta} ${azul}Instalando pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie dialog dosfstools gedit gimp gnome gnome-keyring gnome-tweaks gnu-free-fonts gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db mtools neofetch os-prober pass powerline-fonts rsync speedtest-cli totem transmission-gtk ttf-dejavu  ttf-hack ttf-nerd-fonts-symbols ufw unrar xclip xcursor-vanilla-dmz-aa xdg-user-dirs xdg-utils xf86-input-synaptics youtube-dl --noconfirm
clear

# Desinstalando pacotes -------------------------------------------------
echo -e "${seta} ${vermelho}Desinstalando pacotes desnecessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -R epiphany malcontent gnome-maps gnome-boxes gnome-books gnome-contacts gnome-music gnome-software gnome-terminal --noconfirm
clear

# YAY -------------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Virt-manager ----------------------------------------------------------
echo -e "${seta} ${azul}Instalando o virt-manager${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils ovmf spice-vdagent --noconfirm
clear

echo -e "${seta} ${azul}Iniciando o daemon libvirt${fim}"
sleep 2s
echo $pass_user | sudo -S systemctl enable libvirtd.service
echo $pass_user | sudo -S systemctl start libvirtd.service
clear

echo -e "${seta} ${azul}Inserindo o usuário no grupo libvirt${fim}"
sleep 2s
echo $pass_user | sudo -S usermod -aG libvirt $user
clear

echo -e "${seta} ${azul}Configurando a vermelhoe do virt-manager para iniciar automáticamente${fim}"
sleep 2s
echo $pass_user | sudo -S virsh net-autostart --network default
clear

# Timeshift ------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o timeshift${fim}"
sleep 2s
yay -S timeshift --noconfirm
clear

echo -e "${seta} ${azul}Instalando o lollypop-stable-git${fim}"
sleep 2s
yay -S lollypop-stable-git kid3-cli --noconfirm
clear

# Hackerman ------------------------------------------------------------
echo -e "${seta} ${azul}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump --noconfirm
clear

echo -e "${seta} ${azul}Instalando o crunch${fim}"
sleep 2s
yay -S crunch --noconfirm
clear

# Firmwares -------------------------------------------------------------
echo -e "${seta} ${azul}Instalando os${fim} ${amarelo}firmwares warnigs${fim} ${azl}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware --noconfirm
clear

# Gnome-terminal-transparency -------------------------------------------
echo -e "${seta} ${azul}Instalando o gnome-terminal-transparency${fim}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
#git clone https://github.com/dracula/gnome-terminal
#cd gnome-terminal
#./install.sh
clear

# Cava -------------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o cava${fim}"
sleep 2s
yay -S cava --noconfirm
clear

# Ventoy -------------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o ventoy${fim}"
sleep 2s
yay -S ventoy-bin --noconfirm
clear

# Chess -----------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o Stockfish e Pychess${fim}"
sleep 2s
yay -S stockfish pychess --noconfirm
clear

# minecraft-launcher ----------------------------------------------------
echo -e "${seta} ${azul}Instalando o minecraft-launcher${fim}"
sleep 2s
yay -S minecraft-launcher --noconfirm
clear

# Mint-icons ------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o mint-icons${fim}"
sleep 2s
yay -S mint-y-icons --noconfirm
clear

# Debtap ----------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
clear

# Glxinfo ----------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o glxinfo${fim}"
sleep 2s
yay -S glxinfo --noconfirm
clear

# Google-chrome ---------------------------------------------------------
echo -e "${seta} ${azul}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

# Spotify ---------------------------------------------------------------
echo -e "${seta} ${azul}Instalando spotify${fim}"
sleep 2s
yay -S spotify --noconfirm
clear

# Fontes ----------------------------------------------------------------
echo -e "${seta} ${azul}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

# xdg-user-dirs ---------------------------------------------------------
echo -e "${seta} ${azul}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

# Bluez -----------------------------------------------------------------
echo -e "${seta} ${azul}Iniciando o bluez${fim}"
sleep 2s
bluez
clear

# GDM -------------------------------------------------------------------
echo -e "${seta} ${azul}Instalando o gdm${fim}"
sleep 2s
gdm 
clear

