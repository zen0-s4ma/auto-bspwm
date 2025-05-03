#!/bin/bash

# Detectar la interfaz de red activa
INTERFACE=$(ip route | awk '/default/ {print $5}' | awk '/eth0/{e=$0} /wlan0/{w=$0} END {print e ? e : w}')

# Si no hay interfaz activa
if [ -z "$INTERFACE" ]; then
    echo "󰈂 Sin conexión"
    exit
fi

# Determinar si es Ethernet o WiFi
if [[ "$INTERFACE" == *"wlan"* ]]; then
    TYPE=" WiFi: "
    ESSID=$(iwgetid -r)
else
    TYPE="󰱔 Eth:"
    ESSID=""
fi

# Obtener velocidad de subida y descarga
RX1=$(cat /sys/class/net/"$INTERFACE"/statistics/rx_bytes)
TX1=$(cat /sys/class/net/"$INTERFACE"/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/"$INTERFACE"/statistics/rx_bytes)
TX2=$(cat /sys/class/net/"$INTERFACE"/statistics/tx_bytes)

# Calcular velocidades en MB/s (1 MB = 1048576 bytes)
RX_SPEED_MB=$(echo "scale=1; ($RX2 - $RX1) / 1048576" | bc)
TX_SPEED_MB=$(echo "scale=1; ($TX2 - $TX1) / 1048576" | bc)

# Formatear las velocidades con dos cifras y una decimal
RX_SPEED_FORMATTED=$(printf "%04.1f" $RX_SPEED_MB)
TX_SPEED_FORMATTED=$(printf "%04.1f" $TX_SPEED_MB)

# Mostrar la información formateada
echo "$TYPE$ESSID  ${RX_SPEED_FORMATTED}MB/s  ${TX_SPEED_FORMATTED}MB/s"

