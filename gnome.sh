#!/usr/bin/env bash

# variaveis
user='fabio'
root='root'
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
    echo $pass_user | sudo -S pacman -S nvidia nvidia-utils intel-ucode --noconfirm
}

instalar_gdm(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
}
iniciar_gdm(){
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

# Tela de boas vindas
clear
echo -e "${seta} ${blue}Bem vindo a instalação do gnome${end}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${blue}Atualizando...${end}"
sleep 2s
echo $pass_user | sudo -S pacman -Syu --noconfirm
clear

echo -e "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o driver virt-manager${end}"
echo -e "${seta} ${blue}Digite${end} ${red}[ 2 ]${end} ${blue}para instalar o driver nvidia${end}"
echo -en "${seta} ${yellow}Qual sua resposta:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para virt-manager${end}"
    sleep 2s
    driver_virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para nvidia${end}"
    sleep 2s
    driver_nvidia
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi

echo -e "${seta} ${blue}Instalando o gnome 3${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S gnome gnome-extra --noconfirm
clear

echo -e "${seta} ${blue}Instalando pacotes necessários${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S archlinux-keyring archlinux-wallpaper bash-completion chrome-gnome-shell cmatrix cronie dialog gimp gnome-keyring gnome-tweaks gnupg gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db neofetch pass powerline-fonts rsync tcpdump totem transmission-gtk ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip youtube-dl --noconfirm
clear

echo -e "${seta} ${blue}Instalando o yay${end}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Virt-manager ----------------------------------------------------
echo -e "${seta} ${blue}Instalando o virt-manager${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S qemu virt-manager dnsmasq libvirt ebtables bridge-utils edk2-ovmf spice-vdagent --noconfirm
clear

echo -e "${seta} ${blue}Iniciando o daemon libvirt${end}"
sleep 2s
echo $pass_user | sudo -S systemctl enable libvirtd.service
echo $pass_user | sudo -S systemctl start libvirtd.service
clear

echo -e "${seta} ${blue}Inserindo o usuário no grupo libvirt${end}"
sleep 2s
echo $pass_user | sudo -S usermod -aG libvirt $user
clear

echo -e "${seta} ${blue}Configurando a rede do virt-manager para iniciar automáticamente${end}"
sleep 2s
echo $pass_user | sudo -S virsh net-autostart --network default
clear
# Virt-manager ----------------------------------------------------

echo -e "${seta} ${blue}Instalando o timeshift${end}"
sleep 2s
yay -S timeshift --noconfirm
clear

echo -e "${seta} ${blue}Instalando o woeusb-git${end}"
sleep 2s
yay -S woeusb-git --noconfirm
clear

# Hackerman -------------------------------------------------------
echo -e "${seta} ${blue}Instalando aircrack-ng e usbutils${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils --noconfirm
clear

echo -e "${seta} ${blue}Instalando o crunch${end}"
sleep 2s
yay -S crunch --noconfirm
clear
# Hackerman -------------------------------------------------------

echo -e "${seta} ${blue}Instalando os${end} ${yellow}firmwares warnigs${end} ${blue}do archlinux${end}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware --noconfirm
clear

echo -e "${seta} ${blue}Instalando o gnome-terminal-transparency${end}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

echo -e "${seta} ${blue}Instalando o mint-icons${end}"
sleep 2s
yay -S mint-x-icons mint-y-icons --noconfirm
clear

echo -e "${seta} ${blue}Instalando o debtap${end}"
sleep 2s
yay -S debtap --noconfirm
clear

echo -e "${seta} ${blue}Instalando o google-chrome${end}"
sleep 2s
yay -S google-chrome --noconfirm
clear

echo -e "${seta} ${blue}Instalando spotify${end}"
sleep 2s
yay -S spotify --noconfirm
clear

echo -e "${seta} ${blue}Instalando as fontes${end}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "${seta} ${blue}Iniciando o xdg-update${end}"
sleep 2s
xdg-user-dirs-update
clear

echo -e "${seta} ${blue}Instalando o gdm${end}"
sleep 2s
instalar_gdm 
clear

echo -e "${seta} ${blue}Iniciando o serviço do gdm${end}"
sleep 2s
iniciar_gdm
clear
