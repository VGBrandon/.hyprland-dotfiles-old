#!/bin/bash

# Colores para la salida
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # Sin color

# Descomentar o añadir GRUB_DISABLE_OS_PROBER=false en /etc/default/grub
echo -e "${CYAN}Modificando configuración de GRUB para habilitar os-prober...${NC}"
sudo sed -i 's/^#\?GRUB_DISABLE_OS_PROBER=.*/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

# Ejecutar os-prober y generar la configuración de GRUB
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${GREEN}GRUB ha sido configurado para detectar Windows.${NC}"

