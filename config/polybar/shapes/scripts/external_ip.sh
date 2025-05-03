#!/bin/sh

# Primer intento de obtener la IP pública
IP=$(curl -s http://ip-api.com/json/ | jq -r .query)

# Si el primer intento falla, intenta con otro servicio
if [ -z "$IP" ]; then
    IP=$(curl -s ifconfig.me)
fi

# Comprobar si se obtuvo alguna IP
if [ -n "$IP" ]; then
    # Mostrar la IP en blanco
    echo "%{F#ffffff} %{F#ffffff}$IP%{u-}"
else
    # Si no se pudo obtener ninguna IP, mostrar "Not Connection" en rojo
    echo "%{F#ff0000} Not Connection%{u-}"
fi

