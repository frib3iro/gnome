#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script        : [gnome.sh]
# Descrição     : Script para instalação do gnome e apps nescessários
# Versão        : 1.0
# Autor         : Fabio Junior Ribeiro
# Email         : rib3iro@live.com
# Data          : 11/12/2020
# Licença       : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso           : ./gnome
#----------------------------------------------------------------------
# Cores usadas no script
R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
# Fechamento das cores no script
F='\033[0m'
# Seta utilizada no inicio das frases
S='\e[32;1m[+]\e[m'
#----------------------------------------------------------------------
clear
# Tela de boas vindas
echo -e "${S} ${C}Bem vindo a instalação do gnome!${F}"
sleep 1

# Atualizando os espelhos
echo
echo -e "${S} ${C}Atualizando...${F}"
sleep 1
sudo pacman -Syu --noconfirm

# Instalando gnome
echo
echo -e "${S} ${C}Instalando gnome...${F}"
sleep 1
sudo pacman -S baobab cheese eog evince file-roller gdm gedit gnome-backgrounds gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-contacts gnome-control-center gnome-disk-utility gnome-documents gnome-font-viewer gnome-getting-started-docs gnome-keyring gnome-logs gnome-maps gnome-menus gnome-photos gnome-remote-desktop gnome-screenshot gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-software gnome-system-monitor gnome-themes-extra gnome-user-docs gnome-user-share gnome-video-effects gnome-weather grilo-plugins gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb mutter nautilus networkmanager orca rygel sushi totem tracker tracker-miners tracker3 tracker3-miners vino xdg-user-dirs-gtk yelp simple-scan --noconfirm

# Instalando pacotes
echo
echo -e "${S} ${C}Instalando pacotes...${F}"
sleep 1
sudo pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor gnome-passwordsafe gnome-sound-recorder gparted grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit-plugins gimp gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mesa-demos mtools neofetch os-prober pass rsync qbittorrent shotwell speedtest-cli ufw unrar xclip xcursor-vanilla-dmz-aa xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth lollypop --noconfirm

# YAY
echo
echo -e "${S} ${C}Instalando o yay......${F}"
sleep 1
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Firmwares
echo
echo -e "${S} ${C}Instalando os${F} ${R}firmwares warnigs......${F}"
sleep 1
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm

# Mintstick
echo
echo -e "${S} ${C}Instalando o Mintstick...${F}"
sleep 1
yay -S mintstick --noconfirm

# Downgrade
echo
echo -e "${S} ${C}Instalando o downgrade...${F}"
sleep 1
yay -S downgrade --noconfirm

# Timeshift
echo
echo -e "${S} ${C}Instalando o timeshift...${F}"
sleep 1
yay -S timeshift --noconfirm

# Hackerman
echo
echo -e "${S} ${C}Instalando Pacotes Hacker...${F}"
sleep 1
sudo pacman -S aircrack-ng usbutils tcpdump wifite --noconfirm
yay -S crunch --noconfirm

# Gnome-terminal-transparency
echo
echo -e "${S} ${C}Instalando o gnome-terminal-transparency...${F}"
sleep 1
yay -S gnome-terminal-transparency --noconfirm

# Cava
echo
echo -e "${S} ${C}Instalando o cava...${F}"
sleep 1
yay -S cava --noconfirm

# Ventoy
echo
echo -e "${S} ${C}Instalando o ventoy...${F}"
sleep 1
yay -S ventoy-bin --noconfirm

# Mint-icons
echo
echo -e "${S} ${C}Instalando o mint-icons...${F}"
sleep 1
yay -S mint-y-icons --noconfirm

# Sardi-icons
echo
echo -e "${S} ${C}Instalando o sardi-icons...${F}"
sleep 1
yay -S sardi-icons --noconfirm

# Ant-dracula-theme-git
echo
echo -e "${S} ${C}Instalando o tema ant-dracula-theme-git...${F}"
sleep 1
yay -S ant-dracula-theme-git --noconfirm

# Debtap
echo
echo -e "${S} ${C}Instalando o debtap...${F}"
sleep 1
yay -S debtap --noconfirm

# Google-chrome
echo
echo -e "${S} ${C}Instalando o google-chrome...${F}"
sleep 1
yay -S google-chrome --noconfirm

# Spotify
echo
echo -e "${S} ${C}Instalando o Spotify...${F}"
sleep 1
yay -S spotify --noconfirm

# Fontes
echo
echo -e "${S} ${C}Instalando as fontes...${F}"
sleep 1
sudo pacman -S ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm

# Tema dracula no gedit
echo
echo -e "${S} ${C}Baixando e instalando o tema Dracula no gedit...${F}"
sleep 1
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
sleep 1
if [ -d "/home/fabio/.local/share/gedit/styles" ]
then
    mv dracula.xml /home/fabio/.local/share/gedit/styles/
else
    mkdir -p /home/fabio/.local/share/gedit/styles
    mv dracula.xml /home/fabio/.local/share/gedit/styles/
fi  
echo
echo -e "${S} ${G}Tema instalado com sucesso!...${F}"
sleep 1

# Instalando o virt-manager
echo
echo -e "${S} ${C}Instalando o virt-manager...${F}"
sleep 1
sudo pacman -S qemu qemu-arch-extra virt-manager ovmf bridge-utils dnsmasq vde2 bridge-utils \
openbsd-netcat ebtables iptables --noconfirm
yay -S libguestfs --noconfirm
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf
sudo usermod -a -G libvirt $(whoami)
sudo systemctl restart libvirtd.service
sudo virsh net-start default
sudo virsh net-autostart --network default
echo
echo -e "${S} ${G}Instalação do virt-manager concluída!...${F}"
sleep 1

# xdg-user-dirs
echo
echo -e "${S} ${C}Iniciando o xdg-update...${F}"
sleep 1
xdg-user-dirs-update

# Bluez
echo
echo -e "${S} ${C}Iniciando o bluez...${F}"
sleep 1
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable org.cups.cupsd

# Gnome Display Manager
echo
echo -e "${S} ${C}Instalando o Gnome Display Manager...${F}"
sleep 1
sudo systemctl enable gdm.service
sudo systemctl start gdm.service

