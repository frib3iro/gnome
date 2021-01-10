#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script : [gnome.sh]
# Descrição : Script para instalação do gnome e apps nescessários
# Versão : 1.0
# Autor : Fabio Junior Ribeiro
# Email : rib3iro@live.com
# Data : 11/12/2020
# Licença : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso : ./gnome
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
echo -e "${S} ${C}Bem vindo a instalação do gnome${F}"
sleep 1

# Atualizando os espelhos
echo
echo -e "${S} ${C}Atualizando...${F}"
sleep 1
sudo pacman -Syu --noconfirm

# YAY
echo
echo -e "${S} ${C}Instalando o yay${F}"
sleep 1
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Firmwares
echo
echo -e "${S} ${C}Instalando os${F} ${Y}firmwares warnigs${F} ${C}do archlinux${F}"
sleep 1
yay -S aic94xx-firmware wd719x-firmware upd72020x-fw --noconfirm

# Instalando gnome
echo
echo -e "${S} ${C}Instalando gnome...${F}"
sleep 1
sudo pacman -S baobab cheese eog evince file-roller gdm gedit gnome-backgrounds gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-contacts gnome-control-center gnome-disk-utility gnome-documents gnome-font-viewer gnome-getting-started-docs gnome-keyring gnome-logs gnome-maps gnome-menus gnome-photos gnome-remote-desktop gnome-screenshot gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-software gnome-system-monitor gnome-themes-extra gnome-user-docs gnome-user-share gnome-video-effects gnome-weather grilo-plugins gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb mutter nautilus networkmanager orca rygel sushi totem tracker tracker-miners tracker3 tracker3-miners vino xdg-user-dirs-gtk yelp simple-scan --noconfirm

# Instalando pacotes
echo
echo -e "${S} ${C}Instalando pacotes necessários${F}"
sleep 1
sudo pacman -S arch-wiki-docs arch-wiki-lite alsa-utils dconf-editor gnome-passwordsafe gnome-sound-recorder gparted grub-customizer archlinux-keyring archlinux-wallpaper bash-completion bluez bluez-utils chrome-gnome-shell cmatrix cronie cups dialog dosfstools efibootmgr git gedit-plugins gimp gnome-tweaks gnupg gst-libav gufw htop libreoffice libreoffice-fresh-pt-br lolcat man-db man-pages-pt_br mesa-demos mtools neofetch os-prober pass rsync qbittorrent speedtest-cli ufw unrar xclip xcursor-vanilla-dmz-aa xdg-utils youtube-dl pulseaudio pulseaudio-bluetooth lollypop --noconfirm

# Mintstick
echo
echo -e "${S} ${C}Instalando o Mintstick${F}"
sleep 1
yay -S mintstick --noconfirm

# Downgrade
echo
echo -e "${S} ${C}Instalando o downgrade${F}"
yay -S downgrade --noconfirm

# Timeshift
echo
echo -e "${S} ${C}Instalando o timeshift${F}"
sleep 1
yay -S timeshift --noconfirm

# Hackerman
echo
echo -e "${S} ${C}Instalando Pacotes Hacker${F}"
sleep 1
sudo pacman -S aircrack-ng usbutils tcpdump wifite --noconfirm
yay -S crunch --noconfirm

# Gnome-terminal-transparency
echo
echo -e "${S} ${C}Instalando o gnome-terminal-transparency${F}"
sleep 1
yay -S gnome-terminal-transparency --noconfirm

# Cava
echo
echo -e "${S} ${C}Instalando o cava${F}"
sleep 1
yay -S cava --noconfirm

# Ventoy
echo
echo -e "${S} ${C}Instalando o ventoy${F}"
sleep 1
yay -S ventoy-bin --noconfirm

# Mint-icons
echo
echo -e "${S} ${C}Instalando o mint-icons${F}"
sleep 1
yay -S mint-y-icons --noconfirm

# Sardi-icons
echo
echo -e "${S} ${C}Instalando o sardi-icons${F}"
sleep 1
yay -S sardi-icons --noconfirm

# Ant-dracula-theme-git
echo
echo -e "${S} ${C}Instalando o ant-dracula-theme-git${F}"
sleep 1
yay -S ant-dracula-theme-git --noconfirm

# Debtap
echo
echo -e "${S} ${C}Instalando o debtap${F}"
sleep 1
yay -S debtap --noconfirm

# Google-chrome
echo
echo -e "${S} ${C}Instalando o google-chrome${F}"
sleep 1
yay -S google-chrome --noconfirm

# Spotify
echo
echo -e "${S} ${C}Instalando o Spotify${F}"
sleep 1
yay -S spotify --noconfirm

# Fontes
echo
echo -e "${S} ${C}Instalando as fontes${F}"
sleep 1
sudo pacman -S ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-dejavu ttf-hack --noconfirm
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-roboto --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm

# Tema dracula no gedit
echo
echo -e "${S} ${C}Baixando e instalando o tema Dracula no gedit${F}"
sleep 1
echo -e "${S} ${C}Baixando o tema Dracula para o gedit${F}"
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
echo -e "${S} ${C}Verificando se o diretório styles existe${F}"

if [ -d "/home/fabio/.local/share/gedit/styles" ]
then
    echo -e "${S} ${Y}O diretório styles existe, apenas movendo o tema${F}"
    sleep 1
    mv dracula.xml /home/fabio/.local/share/gedit/styles/
else
    echo -e "${S} ${Y}Criando o diretório styles e movendo o tema${F}"
    sleep 1
    mkdir -p /home/fabio/.local/share/gedit/styles
    mv dracula.xml /home/fabio/.local/share/gedit/styles/
fi
echo -e "${S} ${G}Tema instalado com sucesso!${F}"

# # Menu para escolha do driver de vídeo
# echo
# echo -e "${S} ${C}Instalando Drivers de Vídeo${F}"
# echo
# echo -e "${S} ${C}[ 1 ] Instalar drivers Nvidia${F}"
# echo -e "${S} ${C}[ 2 ] Instalar driver VirtManager${F}"
# echo
# echo -en "${S} ${Y}Digite a opção desejada: ${F}"
# read opcao
# case $opcao in
# 1)
# echo
# echo -e "${S} ${C}Instalando o driver de vídeo da nvidia...${F}"
   # sudo pacman -S nvidia nvidia-utils nvidia-settings --noconfirm
   # echo -e "${S} ${C}Resolvendo o problema do Wayland e o driver proprietário da NVIDIA...${F}"
   # sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
# ;;
# 2)
    # echo -e "${S} ${C}Instalando o driver de vídeo do virt-manager...${F}"
    # echo
    # sudo pacman -S xf86-video-qxl --noconfirm
    # ;;
# *)
    # echo
    # echo "${S} ${R}O sistema será instalado sem os drivers!${F}"
    # esac

# Instalando o virt-manager
echo
echo -e "${S} ${C}Instalando o virt-manager${F}"
sudo pacman -S qemu qemu-arch-extra virt-manager ovmf bridge-utils dnsmasq vde2 bridge-utils \
openbsd-netcat ebtables iptables --noconfirm

echo -e "${S} ${C}Instalando o libguestfs${F}"
yay -S libguestfs --noconfirm

echo -e "${S} ${C}Inicializando o serviço libvirt${F}"
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo -e "${S} ${C}Habilitando o grupo libvirt para unix_sock_group${F}"
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf

echo -e "${S} ${C}Habilitando leitura e escrita para o grupo libvirt${F}"
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

echo -e "${S} ${C}Adicionando o usuário ao grupo libvirt${F}"
sudo usermod -a -G libvirt $(whoami)

echo -e "${S} ${C}Reinicializando o serviço${F}"
sudo systemctl restart libvirtd.service

echo -e "${S} ${C}Configurando o libvirt para inicializar automaticamente o serviço de rede${F}"
sudo virsh net-start default
sudo virsh net-autostart --network default
echo
echo -e "${S} ${G}instalação do virt-manager concluída!${F}"

# xdg-user-dirs
echo
echo -e "${S} ${C}Iniciando o xdg-update${F}"
sleep 1
xdg-user-dirs-update

# Bluez
echo
echo -e "${S} ${C}Iniciando o bluez${F}"
sleep 1
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable org.cups.cupsd

# Gnome Display Manager
echo
echo -e "${S} ${C}Instalando o Gnome Display Manager${F}"
sleep 1
sudo pacman -S gdm --noconfirm
sudo systemctl enable gdm

