#!/bin/bash

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
echo -e "${GREEN}Iniciando la instalación de dotfiles...${NC}"

# Verificar y ejecutar el script de instalación de paquetes oficiales
echo -e "${GREEN}Instalando Paquetes Oficiales de Archlinux...${NC}"
check_file_exists "./install-official-packages.sh"
echo -e "${GREEN}Se termino de instalar los paquetes oficiales de Archlinux...${NC}"

# Verificar y ejecutar el script de configuracion de Git
check_file_exists "./configure_git.sh"

# Verificar y ejecutar el script que agrega Windows a GRUB
check_file_exists "./configure_grub.sh"

echo -e "${GREEN}Instalando Yay...${NC}"
git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u $USER makepkg -si --noconfirm
cd ..
sudo rm -rf yay

echo -e "${GREEN}Instalación de dotfiles completada.${NC}"
