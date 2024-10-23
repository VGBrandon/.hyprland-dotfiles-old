#!/bin/sh 
#
# Iniciador de Waybar
#
# por VGBrandon
#
# ---------------------------------------------------------

#----------------------------------------------------------
# Terminar proceso de las instancias de waybar que se estan ejecutando
#----------------------------------------------------------
killall waybar

#----------------------------------------------------------
# Función para cargar barra Waybar según el nombre proporcionado
#----------------------------------------------------------
load_waybar() {
    local bar_name="$1"  # Nombre de la barra (por ejemplo, arrow-bar)

    # Rutas para la configuración y el estilo basadas en el nombre
    local config_path="$HOME/.config/waybar/bars/$bar_name.jsonc"
    local style_path="$HOME/.config/waybar/styles/$bar_name.css"

    # Verificar si los archivos de configuración y estilo existen
    if [[ -f "$config_path" && -f "$style_path" ]]; then
        echo "Cargando Waybar con la configuración '$config_path' y el estilo '$style_path'"
        waybar -c "$config_path" -s "$style_path" &
    else
        echo "Error: Configuración o estilo para '$bar_name' no encontrado."
        exit 1
    fi
}

#----------------------------------------------------------
# Cargar la barra basada en el username (o cualquier otra condición)
#----------------------------------------------------------
if [ "$USER" = "vgbrandon" ]; then
    # Llamar a la función con el nombre de la barra deseada
    load_waybar "pruebita"
    
    # Puedes cargar más barras llamando a la función con diferentes nombres
    # load_waybar "otra-barra"
else
    # Cargar una barra genérica
    load_waybar "default-bar"
fi

