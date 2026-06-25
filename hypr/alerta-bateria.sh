#!/bin/bash

while true; do
    # Lê a porcentagem e o status (se está carregando ou não)
    BAT_LVL=$(cat /sys/class/power_supply/BAT*/capacity | head -1)
    BAT_STAT=$(cat /sys/class/power_supply/BAT*/status | head -1)

    # Se estiver menor ou igual a 25 e fora da tomada, envia notificação
    if [[ "$BAT_LVL" -le 25 && "$BAT_STAT" == "Discharging" ]]; then
        notify-send -u critical "Bateria Fraca!" "Apenas $BAT_LVL% restantes. Conecte o carregador."
        sleep 300 # Espera 5 minutos para não repetir o aviso sem parar
    else
        sleep 60 # Checa novamente a cada 1 minuto
    fi
done
