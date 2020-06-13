#!/usr/bin/env bash

# variaveis
azl='\e[34;1m'
vrd='\e[32;1m'
vrm='\e[31;1m'
amr='\e[33;1m'
fim='\e[m'
seta='\e[32;1m==>\e[m'

[[ "$UID" -ne '0' ]] && { echo -e "${vr}Logue-se como root${fim}"; exit 1;}

# Funções ------------------------------------------------------------
driver_virtmanager(){
    pacman -S xf86-video-qxl --noconfirm
}

driver_nvidia(){
    pacman -S nvidia nvidia-utils intel-ucode --noconfirm
}

iniciar_bluez(){
    systemctl enable bluetooth
    systemctl start bluetooth
}

instalar_gdm(){
    pacman -S gdm --noconfirm
}

iniciar_gdm(){
    systemctl enable gdm
    systemctl start gdm
}

# Tela de boas vindas
clear
echo -e "${seta} ${azl}Bem vindo a instalação do gnome${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${azl}Atualizando...${fim}"
sleep 2s
pacman -Syu --noconfirm
clear

echo -e "${seta} ${azl}Digite${fim} ${vrm}[ 1 ]${fim} ${azl}para instalar o driver virt-manager${fim}"
echo -e "${seta} ${azl}Digite${fim} ${vrm}[ 2 ]${fim} ${azl}para instalar o driver nvidia${fim}"
echo -en "\n${seta} ${amr}Qual sua resposta:${fim} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${azl}Iniciando instalação do driver para virt-manager${fim}"
    sleep 2s
    driver_virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${azl}Iniciando instalação do driver para nvidia${fim}"
    sleep 2s
    driver_nvidia
    clear
else
    echo -e "${seta} ${vrm}Resposta inválida!${fim}"
    exit 1
fi

echo -e "${seta} ${azl}Instalando o gnome${fim}"
sleep 2s
pacman -S gnome --noconfirm
clear

echo -e "${seta} ${azl}Instalando pacotes necessários${fim}"
sleep 2s
pacman -S archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils blueman chrome-gnome-shell cmatrix cronie dialog gimp gnome-keyring gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db neofetch pass powerline-fonts rsync speedtest-cli totem transmission-gtk ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip youtube-dl lolcat --noconfirm
clear

echo -e "${seta} ${vrm}Desinstalando pacotes desnecessários${fim}"
sleep 2s
pacman -R gnome-maps gnome-boxes gnome-books gnome-contacts gnome-music gnome-software gnome-terminal malcontent --noconfirm
echo -e "\n${seta} ${amr}Aperte enter para continuar${fim}"
read
clear

echo -e "${seta} ${azl}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Virt-manager ----------------------------------------------------
echo -e "${seta} ${azl}Instalando o virt-manager${fim}"
sleep 2s
pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils ovmf spice-vdagent --noconfirm
clear

echo -e "${seta} ${azl}Iniciando o daemon libvirt${fim}"
sleep 2s
systemctl enable libvirtd.service
systemctl start libvirtd.service
clear

echo -e "${seta} ${azl}Inserindo o usuário no grupo libvirt${fim}"
sleep 2s
usermod -aG libvirt $USER
clear

echo -e "${seta} ${azl}Configurando a vrme do virt-manager para iniciar automáticamente${fim}"
sleep 2s
virsh net-autostart --network default
clear
# Virt-manager ----------------------------------------------------

echo -e "${seta} ${azl}Instalando o timeshift${fim}"
sleep 2s
yay -S timeshift --noconfirm
clear

echo -e "${seta} ${azl}Instalando o lollypop-stable-git${fim}"
sleep 2s
yay -S lollypop-stable-git kid3-cli --noconfirm
clear

# Hackerman -------------------------------------------------------
echo -e "${seta} ${azl}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
pacman -S aircrack-ng usbutils tcpdump --noconfirm
clear

echo -e "${seta} ${azl}Instalando o crunch${fim}"
sleep 2s
yay -S crunch --noconfirm
clear
# Hackerman -------------------------------------------------------

echo -e "${seta} ${azl}Instalando os${fim} ${amr}firmwares warnigs${fim} ${azl}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware --noconfirm
clear

echo -e "${seta} ${azl}Instalando o gnome-terminal-transparency${fim}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

echo -e "${seta} ${azl}Instalando o mint-icons${fim}"
sleep 2s
yay -S mint-y-icons --noconfirm
clear

echo -e "${seta} ${azl}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
clear

echo -e "${seta} ${azl}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

echo -e "${seta} ${azl}Instalando spotify${fim}"
sleep 2s
yay -S spotify --noconfirm
clear

echo -e "${seta} ${azl}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "${seta} ${azl}Iniciando o bluez${fim}"
sleep 2s
iniciar_bluez
clear

echo -e "${seta} ${azl}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

echo -e "${seta} ${azl}Instalando o gdm${fim}"
sleep 2s
instalar_gdm 
clear

echo -e "${seta} ${azl}Iniciando o serviço do gdm${fim}"
sleep 2s
iniciar_gdm
