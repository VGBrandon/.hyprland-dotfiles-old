#!/bin/bash

# Verificar si el archivo official-packages.txt existe
if [[ -f "official-packages.txt" ]]; then
    # Leer los paquetes desde official-packages.txt, eliminando comentarios y líneas vacías
    PACKAGES=$(grep -vE '^\s*#|^\s*$' official-packages.txt | awk '{print $1}')

    # Instalar los paquetes
    if [ -n "$PACKAGES" ]; then
        sudo pacman -S --noconfirm $PACKAGES
    else
        echo "No hay paquetes para instalar."
    fi
else
    echo "Error: El archivo official-packages.txt no existe."
fi
