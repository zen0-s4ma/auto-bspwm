#!/bin/sh

# Verificar si el servicio Docker está activo
if systemctl is-active --quiet docker; then
    # Docker está activo
    echo "%{F#ffffff}󰡨 Docker ON%{u-}"
else
    # Docker no está activo
    echo "%{F#ff0000}󰡨 Docker OFF%{u-}"
fi

