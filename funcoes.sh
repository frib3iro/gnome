#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script    : [funcoes.sh]
# Descrição : Funções usadas na instalação do gnome
# Versão    : 1.0
# Autor     : Fabio Junior Ribeiro <rib3iro@live.com>
# Data      : 11/12/2020
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       : ./gnome.sh
#----------------------------------------------------------------------

VirtManagerDriver(){
    echo -e "${S}${C}Instalando o driver de vídeo do virt-manager...${F}"
    sleep 2
    echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
}

NvidiaDriver(){
    echo -e "${S}${C}Instalando o driver de vídeo da nvidia...${F}"
    sleep 2
    echo $pass_user | sudo -S pacman -S nvidia nvidia-utils nvidia-settings --noconfirm
    echo -e "${S}${C}Resolvendo o problema do Wayland e o driver proprietário da NVIDIA...${F}"
    sleep 2
    echo $pass_user | sudo -S  ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
}

Bluez(){
    echo $pass_user | sudo -S systemctl enable bluetooth
    echo $pass_user | sudo -S systemctl start bluetooth
    echo $pass_user | sudo -S systemctl enable org.cups.cupsd
}

GnomeDisplayManager(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

TemaDraculaGedit(){
    echo -e "${S}${C}Baixando o tema Dracula para o gedit${F}"
    sleep 2
    wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml

    echo -e "${S}${C}Verificando se o diretório styles existe${F}"
    sleep 2

    if [ -d "/home/fabio/.local/share/gedit/styles" ]
    then
        echo -e "${S}${Y}O diretório styles existe, apenas movendo o tema${F}"
        sleep 2
        mv dracula.xml /home/fabio/.local/share/gedit/styles/
    else
        echo -e "${S}${Y}Criando o diretório styles e movendo o tema${F}"
        sleep 2
        mkdir -p /home/fabio/.local/share/gedit/styles
        mv dracula.xml /home/fabio/.local/share/gedit/styles/
    fi

    echo -e "${S}${G}Tema instalado com sucesso!${F}"
    sleep 2
}

VirtManager(){
    echo -e "${S}${C}Instalando o virt-manager${F}"
    sleep 2s
    echo $pass_user | sudo -S pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat --noconfirm
    clear

    echo -e "${S}${C}Instalando o libguestfs${F}"
    sleep 2s
    yay -S libguestfs --noconfirm
    clear

    echo -e "${S}${C}Inicializando o serviço libvirt${F}"
    sleep 2s
    echo $pass_user | sudo -S systemctl enable libvirtd
    echo $pass_user | sudo -S systemctl start libvirtd
    clear

    echo -e "${S}${C}Habilitando o grupo libvirt para unix_sock_group${F}"
    sleep 2s
    echo $pass_user | sudo -S sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
    clear

    echo -e "${S}${C}Habilitando leitura e escrita para o grupo libvirt${F}"
    sleep 2s
    echo $pass_user | sudo -S sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf
    clear

    echo -e "${S}${C}Adicionando o usuário ao grupo libvirt${F}"
    sleep 2s
    echo $pass_user | sudo -S gpasswd -a $USER libvirt
    clear

    echo -e "${S}${C}Reinicializando o serviço${F}"
    sleep 2s
    echo $pass_user | sudo -S systemctl restart libvirtd.service
    clear

    echo -e "${S}${C}Configurando o libvirt para inicializar automaticamente o serviço de rede${F}"
    sleep 2s
    echo $pass_user | sudo -S virsh net-start default
    echo $pass_user | sudo -S virsh net-autostart --network default
    echo
    echo -e "${S}${G}instalação do virt-manager concluída!${F}"
    sleep 2
    clear
}
