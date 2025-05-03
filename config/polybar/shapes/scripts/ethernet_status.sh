#!/bin/sh

# Obtener la dirección IP local de la interfaz eth0
IP=$(/usr/sbin/ifconfig eth0 2>/dev/null | grep "inet " | awk '{print $2}')

# Comprobar si se obtuvo la IP
if [ -n "$IP" ]; then
    # Si hay conexión local, mostrar la IP en blanco
    echo "%{F#ffffff}󰌗 %{F#ffffff}$IP%{u-}"
else
    # Si no hay conexión local, mostrar "Not Local Connection" en rojo
    echo "%{F#FFFF90}󰌗 Not LAN%{u-}"
fi

