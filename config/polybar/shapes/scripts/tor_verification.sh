#!/bin/sh

# Variables
TOR_PROXY="127.0.0.1:9050"

# Verificar si Tor está conectado usando curl a través del proxy
# Añadir el parametro "--socks5-hostname $TOR_PROXY" para que se conecte atraves del proxy en vez de directamente. Esto se usa cuando el trafico no está redirigido totalmente por tor
if curl --silent https://check.torproject.org/ | grep -q "Congratulations. This browser is configured to use Tor"; then
    echo "%{F#1E8449 }󰠥 TOR ON%{u-}"
else
    echo "%{F#FFFFFF}󰌙 TOR OFF%{u-}"
fi

