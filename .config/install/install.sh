#!/bin/bash

# Instalar figlet para mostrar titulos
sudo pacman -S --noconfirm figlet

# Incluyendo otros scripts
source ./convert_to_ascii_art.sh

# Colores para la salida
GREEN="\e[32m"
RED="\e[31m"
NC="\e[0m" # No color

# Función para verificar si un archivo existe
check_file_exists() {
    local file="$1"
    if [[ -f "$file" ]]; then
        echo -e "${GREEN}Llamando a $file...${NC}"
        bash "$file"
    else
        echo -e "${RED}Error: $file no encontrado.${NC}"
        exit 1
    fi
}

# Mensaje de inicio
convertir_a_ascii "Iniciando la instalacion de Dotfiles" "red"

convertir_a_ascii "Instalando Paquetes Oficiales de Archlinux" "blue"

# Verificar y ejecutar el script de instalación de paquetes oficiales
check_file_exists "./install-official-packages.sh"

convertir_a_ascii "Configurando Git" "red"

# Verificar y ejecutar el script de configuracion de Git
check_file_exists "./configure_git.sh"

convertir_a_ascii "Configurando Grub" "red"

# Verificar y ejecutar el script que agrega Windows a GRUB
check_file_exists "./configure_grub.sh"

convertir_a_ascii "Instalando Yay" "blue"

git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u $USER makepkg -si --noconfirm
cd ..
sudo rm -rf yay

convertir_a_ascii "Instalando paquetes no oficiales" "blue"

# Verificar y ejecutar el script de instalacion de paquetes aur
check_file_exists "./install-aur-packages.sh"

convertir_a_ascii "Cambiando shell a Zsh" "green"

# Cambiando la shell predeterminada a Zsh
chsh -s $(which zsh)

convertir_a_ascii "Creando Symlinks de Dotfiles" "green"

# Verificar y ejecutar stow para crear los symlinks
check_file_exists "./rename-exist-files-for-execute-stow.sh"

convertir_a_ascii "Instalando GTK Theme - Gruvbox Material"

echo -e "${GREEN}Instalando gtk de gruvbox-material...${NC}"
git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk.git
cp -r gruvbox-material-gtk/themes/* ~/.themes
cp -r gruvbox-material-gtk/icons/* ~/.icons
sudo rm -rf gruvbox-material-gtk
nwg-look -a

#convertir_a_ascii "Instalando Oh My Zsh y plugins" "red"

# Instalar ohmyzsh y plugins
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#Plugins
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Editando el .zshrc para usar los plugins

# Agregar configuracion adicional para Git
convertir_a_ascii "Agregando configuracion adicional de git para las llaves" "green"
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

convertir_a_ascii "Instalacion de Dotfiles completada"

# Verificar y ejecutar script para reiniciar
check_file_exists "./reboot.sh"
