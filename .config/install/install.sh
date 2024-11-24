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

echo -e "    ____           __        __                __                                      __                     _____      _       __         
   /  _/___  _____/ /_____ _/ /___ _____  ____/ /___     ____  ____ _____ ___  _____  / /____  _____   ____  / __(_)____(_)___ _/ /__  _____
   / // __ \/ ___/ __/ __ \`/ / __ \`/ __ \\/ __  / __ \\   / __ \\/ __ \`/ __ \`/ / / / _ \\/ __/ _ \\/ ___/  / __ \\/ /_/ / ___/ / __ \`/ / _ \\/ ___/
 _/ // / / (__  ) /_/ /_/ / / /_/ / / / / /_/ / /_/ /  / /_/ / /_/ / /_/ / /_/ /  __/ /_/  __(__  )  / /_/ / __/ / /__/ / /_/ / /  __(__  ) 
/___/_/ /_/____/\\__/\\__,_/_/\\__,_/_/ /_/\\__,_/\\____/  / .___/\\__,_/\\__, /\\__,_/\\___/\\__/\\___/____/   \\____/_/ /_/\\___/_/\\__,_/_/\\___/____/  
                                                     /_/             /_/                                                                    
"

check_file_exists "./install-official-packages.sh"
echo -e "${GREEN}Se termino de instalar los paquetes oficiales de Archlinux...${NC}"

echo -e "   ______            _____                                _______ __ 
  / ____/___  ____  / __(_)___ ___  ___________ ______   / ____(_) /_
 / /   / __ \\/ __ \\/ /_/ / __ \`/ / / / ___/ __ \`/ ___/  / / __/ / __/
/ /___/ /_/ / / / / __/ / /_/ / /_/ / /  / /_/ / /     / /_/ / / /_  
\\____/\\____/_/ /_/_/ /_/\\__, /\\__,_/_/   \\__,_/_/      \\____/_/\\__/  
                       /____/                                        
"

# Verificar y ejecutar el script de configuracion de Git
check_file_exists "./configure_git.sh"

echo -e "   ______            _____                                  __         ______           __  
  / ____/___  ____  / __(_)___ ___  ___________ _____  ____/ /___     / ____/______  __/ /_ 
 / /   / __ \\/ __ \\/ /_/ / __ \`/ / / / ___/ __ \`/ __ \\/ __  / __ \\   / / __/ ___/ / / / __ \\
/ /___/ /_/ / / / / __/ / /_/ / /_/ / /  / /_/ / / / / /_/ / /_/ /  / /_/ / /  / /_/ / /_/ /
\\____/\\____/_/ /_/_/ /_/\\__, /\\__,_/_/   \\__,_/_/ /_/\\__,_/\\____/   \\____/_/   \\__,_/_.___/ 
                       /____/                                                               
"

# Verificar y ejecutar el script que agrega Windows a GRUB
check_file_exists "./configure_grub.sh"

echo -e "    ____           __        __                __         __  __           
   /  _/___  _____/ /_____ _/ /___ _____  ____/ /___      \\ \\/ /___ ___  __
   / // __ \\/ ___/ __/ __ \`/ / __ \`/ __ \\/ __  / __ \\      \\  / __ \`/ / / /
 _/ // / / (__  ) /_/ /_/ / / /_/ / / / / /_/ / /_/ /      / / /_/ / /_/ / 
/___/_/ /_/____/\\__/\\__,_/_/\\__,_/_/ /_/\\__,_/\\____/      /_/\\__,_/\\__, /  
                                                                  /____/   
"

echo -e "${GREEN}Instalando Yay...${NC}"
git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u $USER makepkg -si --noconfirm
cd ..
sudo rm -rf yay

echo -e "    ____           __        __                __                                      __               ___   __  ______ 
   /  _/___  _____/ /_____ _/ /___ _____  ____/ /___     ____  ____ _____ ___  _____  / /____  _____   /   | / / / / __ \\
   / // __ \\/ ___/ __/ __ \`/ / __ \`/ __ \\/ __  / __ \\   / __ \\/ __ \`/ __ \`/ / / / _ \\/ __/ _ \\/ ___/  / /| |/ / / / /_/ /
 _/ // / / (__  ) /_/ /_/ / / /_/ / / / / /_/ / /_/ /  / /_/ / /_/ / /_/ / /_/ /  __/ /_/  __(__  )  / ___ / /_/ / _, _/ 
/___/_/ /_/____/\\__/\\__,_/_/\\__,_/_/ /_/\\__,_/\\____/  / .___/\\__,_/\\__, /\\__,_/\\___/\\__/\\___/____/  /_/  |_/____/_/ |_|  
                                                     /_/             /_/                                                 
"

# Verificar y ejecutar el script de instalacion de paquetes aur
check_file_exists "./install-aur-packages.sh"

echo -e "   ______                __    _                 __              __         ____                       _____  _____ __  __
  / ____/___ _____ ___  / /_  (_)___ _____  ____/ /___     _____/ /_  ___  / / /  ____  ____  _____   /__  / / ___// / / /
 / /   / __ \`/ __ \`__ \\/ __ \\/ / __ \`/ __ \\/ __  / __ \\   / ___/ __ \\/ _ \\/ / /  / __ \\/ __ \\/ ___/     / /  \\__ \\/ /_/ / 
/ /___/ /_/ / / / / / / /_/ / / /_/ / / / / /_/ / /_/ /  (__  ) / / /  __/ / /  / /_/ / /_/ / /        / /_____/ / __  /  
\\____/\\__,_/_/ /_/ /_/_.___/_/\\__,_/_/ /_/\\__,_/\\____/  /____/_/ /_/\\___/_/_/  / .___/\\____/_/        /____/____/_/ /_/   
                                                                              /_/                                         
"

# Cambiando la shell predeterminada a Zsh
echo -e "${GREEN}Cambiando la shell predeterminada a Zsh...${NC}"
chsh -s $(which zsh)

echo -e "   ______                          __                              ___       __               __            __      __  _____ __         
  / ____/_______  ____ _____  ____/ /___     _______  ______ ___  / (_)___  / /_______   ____/ /__     ____/ /___  / /_/ __(_) /__  _____
 / /   / ___/ _ \\/ __ \`/ __ \\/ __  / __ \\   / ___/ / / / __ \`__ \\/ / / __ \\/ //_/ ___/  / __  / _ \\   / __  / __ \\/ __/ /_/ / / _ \\/ ___/
/ /___/ /  /  __/ /_/ / / / / /_/ / /_/ /  (__  ) /_/ / / / / / / / / / / / ,< (__  )  / /_/ /  __/  / /_/ / /_/ / /_/ __/ / /  __(__  ) 
\\____/_/   \\___/\\__,_/_/ /_/\\__,_/\\____/  /____/\\__, /_/ /_/ /_/_/_/_/ /_/_/|_/____/   \\__,_/\\___/   \\__,_/\\____/\\__/_/ /_/_/\\___/____/  
                                               /____/                                                                                    
"

# Verificar y ejecutar stow para crear los symlinks
echo -e "${GREEN}Creando symlinks de mis dotfiles...${NC}"
check_file_exists "./rename-exist-files-for-execute-stow.sh"

echo -e "    ____           __        __                __         ______________ __    ________                      
   /  _/___  _____/ /_____ _/ /___ _____  ____/ /___     / ____/_  __/ //_/   /_  __/ /_  ___  ____ ___  ___ 
   / // __ \\/ ___/ __/ __ \`/ / __ \`/ __ \\/ __  / __ \\   / / __  / / / ,<       / / / __ \\/ _ \\/ __ \`__ \\/ _ \\
 _/ // / / (__  ) /_/ /_/ / / /_/ / / / / /_/ / /_/ /  / /_/ / / / / /| |     / / / / / /  __/ / / / / /  __/
___/_/ /_/____/\\__/\\__,_/_/\\__,_/_/ /_/\\__,_/\\____/   \\____/ /_/ /_/ |_|    /_/ /_/ /_/\\___/_/ /_/ /_/\\___/ 
"

echo -e "${GREEN}Instalando gtk de gruvbox-material...${NC}"
git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk.git
cp -r gruvbox-material-gtk/themes/* ~/.themes
cp -r gruvbox-material-gtk/icons/* ~/.icons
sudo rm -rf gruvbox-material-gtk
nwg-look -a

echo -e "    ____           __        __                __         ____  __    __  ___     _____        __                      __            _           
   /  _/___  _____/ /_____ _/ /___ _____  ____/ /___     / __ \\/ /_  /  |/  /_  _/__  /  _____/ /_     __  __   ____  / /_  ______ _(_)___  _____
   / // __ \\/ ___/ __/ __ \`/ / __ \`/ __ \\/ __  / __ \\   / / / / __ \\/ /|_/ / / / / / /  / ___/ __ \\   / / / /  / __ \\/ / / / / __ \`/ / __ \\/ ___/
 _/ // / / (__  ) /_/ /_/ / / /_/ / / / / /_/ / /_/ /  / /_/ / / / / /  / / /_/ / / /__(__  ) / / /  / /_/ /  / /_/ / / /_/ / /_/ / / / / (__  ) 
/___/_/ /_/____/\\__/\\__,_/_/\\__,_/_/ /_/\\__,_/\\____/   \\____/_/ /_/_/  /_/\\__, / /____/____/_/ /_/   \\__, /  / .___/_/\\__,_/\\__, /_/_/ /_/____/  
                                                                         /____/                     /____/  /_/            /____/                "

# Instalar ohmyzsh y plugins
echo -e "${GREEN}Instalando Oh My Zsh y plugins...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Editando el .zshrc para usar los plugins
echo -e "${GREEN}Configurando .zshrc...${NC}"
# Modificar el archivo .zshrc para actualizar la línea de plugins
sed -i '/^plugins=(git)/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc
# Mensaje de éxito
echo -e "${GREEN}.zshrc configurado correctamente.${NC}"
# Esto talvez se cambie en el futuro y sea un archivo de mis dotfiles

# Agregar configuracion adicional para Git
echo -e "${GREEN}Agregando configuracion adicional de git para las llaves...${NC}"
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

# Verificar y ejecutar script para reiniciar
check_file_exists "./reboot.sh"

echo -e "${GREEN}Instalación de dotfiles completada.${NC}"
