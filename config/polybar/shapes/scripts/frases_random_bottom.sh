#!/bin/bash

# Ruta al archivo de frases
FILE=~/.config/polybar/shapes/scripts/frases_inteligencia_amenazas.txt

# Verifica si el archivo existe
if [[ -f "$FILE" ]]; then
    # Selecciona una línea aleatoria del archivo
    shuf -n 1 "$FILE"
else
    echo "Archivo no encontrado"
fi

