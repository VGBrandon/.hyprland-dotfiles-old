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

# Verificar y ejecutar el script de instalacion de paquetes aur
check_file_exists "./install-aur-packages.sh"

# Cambiando la shell predeterminada a Zsh
echo -e "${GREEN}Cambiando la shell predeterminada a Zsh...${NC}"
chsh -s $(which zsh)

# Verificar y ejecutar stow para crear los symlinks
echo -e "${GREEN}Creando symlinks de mis dotfiles...${NC}"
check_file_exists "./rename-exist-files-for-execute-stow.sh"

echo -e "${BLUE}Instalando gtk de gruvbox-material...${NC}"
git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk.git
cp -r gruvbox-material-gtk/themes/* ~/.themes
cp -r gruvbox-material-gtk/icons/* ~/.icons
sudo rm -rf gruvbox-material-gtk
nwg-look -a

# Instalar ohmyzsh y plugins
echo -e "${BLUE}Instalando Oh My Zsh y plugins...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Editando el .zshrc para usar los plugins
echo -e "${CYAN}Configurando .zshrc...${NC}"
# Modificar el archivo .zshrc para actualizar la línea de plugins
sed -i '/^plugins=(git)/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc
# Mensaje de éxito
echo -e "${GREEN}.zshrc configurado correctamente.${NC}"
# Esto talvez se cambie en el futuro y sea un archivo de mis dotfiles

# Agregar configuracion adicional para Git
echo -e "${BLUE}Agregando configuracion adicional de git para las llaves...${NC}"
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

# Verificar y ejecutar script para reiniciar
check_file_exists "./reboot.sh"

echo -e "${GREEN}Instalación de dotfiles completada.${NC}"
