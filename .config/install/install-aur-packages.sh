#!/bin/bash

# Verificar si el archivo aur-packages.txt existe
if [[ -f "aur-packages.txt" ]]; then
    # Leer los paquetes desde aur-packages.txt, eliminando comentarios y líneas vacías
    PACKAGES=$(grep -vE '^\s*#|^\s*$' aur-packages.txt | awk '{print $1}')

    # Instalar los paquetes
    if [ -n "$PACKAGES" ]; then
        yay -S --noconfirm $PACKAGES
    else
        echo "No hay paquetes para instalar."
    fi
else
    echo "Error: El archivo aur-packages.txt no existe."
fi
