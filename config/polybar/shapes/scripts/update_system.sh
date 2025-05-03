#!/bin/bash

# Definir el emulador de terminal como kitty
TERMINAL="kitty"

# Verificar si kitty está instalado
if ! command -v $TERMINAL &>/dev/null; then
    echo "Kitty no está instalado. Instálalo con: sudo apt install kitty"
    exit 1
fi

# Ejecutar los comandos en una nueva terminal
$TERMINAL bash -c "
    echo 'Actualizando lista de paquetes...';
    sudo apt update;

    echo 'Instalando actualizaciones disponibles...';
    sudo apt upgrade -y;

    echo 'Realizando una actualización completa...';
    sudo apt full-upgrade -y;

    echo 'Limpieza de paquetes innecesarios...';
    sudo apt autoremove -y;

    echo 'Sistema actualizado correctamente.';
    read -p 'Presiona Enter para cerrar...'
" &

