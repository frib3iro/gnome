#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script    : gedit.sh
# Descrição : Instala o tema dracula no gedit
# Versão    : 0.1
# Autor     : Fabio Junior Ribeiro <rib3iro@live.com>
# Data      : 21/07/2020
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       : Executar apenas, o tema será instalado automáticamente
#----------------------------------------------------------------------

# variaveis
azul='\033[0;34m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'
caminho='/home/fabio/.local/share/gedit/styles'

mover(){
    mv dracula.xml $caminho
}

# Tela de boas vindas
clear
echo -e "${seta} ${azul}Bem vindo a instalação do tema dracula no gedit${fim}"
sleep 2s
clear

echo -e "${seta} ${azul}Fazendo o download do tema...${fim}"
sleep 2s
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
clear

echo -e "${seta} ${azul}Verificando o diretório e criando se nescessário${fim}"
sleep 2
clear
if [ -d "$caminho" ]; then
echo -e "${seta} ${azul}O diretório existe, o tema será movido apenas${fim}"
    sleep 2s
    mover
    clear
else
echo -e "${seta} ${azul}O diretório não existe e será criado para mover o tema${fim}"
    sleep 2s
    mkdir -p $caminho
    mover
    clear
fi
