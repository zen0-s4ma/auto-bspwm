#!/bin/bash

# Obtener el nombre completo del país usando ip-api.com
CITY=$(curl -s http://ip-api.com/json/ | jq -r .city)
COUNTRYCODE=$(curl -s http://ip-api.com/json/ | jq -r .countryCode)

# Comprobar si la respuesta es válida
if [ -n "$CITY" ] && [ "$CITY" != "null" ]; then
    if [ "$COUNTRYCODE" = "ES" ]; then
        # Si es España, mostrar en blanco
        echo "%{F#ffffff}   $CITY%{u-}"
    else
        # Si no es España, mostrar en amarillo
        echo "%{F#fff00f} %{F#fff00f}  %{F#fff00f}$CITY%{u-}"
    fi
else
    # Si no se puede obtener el país, mostrar error en rojo
    echo "%{F#ff0000}  ¿?%{u-}"
fi

