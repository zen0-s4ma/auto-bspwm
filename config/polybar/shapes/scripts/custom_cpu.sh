#!/bin/bash

# Leer los tiempos de CPU actuales desde /proc/stat
read -r cpu user nice system idle iowait irq softirq steal guest < /proc/stat

# Calcular el total y el tiempo usado
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
used=$((user + nice + system))

# Leer tiempos anteriores si existen
if [[ -f /tmp/cpu_prev ]]; then
  read -r prev_total prev_used < /tmp/cpu_prev
else
  prev_total=$total
  prev_used=$used
fi

# Guardar los valores actuales para la próxima ejecución
echo "$total $used" > /tmp/cpu_prev

# Calcular el porcentaje de uso
diff_total=$((total - prev_total))
diff_used=$((used - prev_used))

if ((diff_total == 0)); then
  percentage=0
else
  percentage=$((100 * diff_used / diff_total))
fi

# Asegurar que el porcentaje siempre tenga dos dígitos
printf " CPU %02d%%\n" "$percentage"

