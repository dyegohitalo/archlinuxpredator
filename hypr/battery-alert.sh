#!/bin/bash

while true; do
    # Encontra automaticamente a pasta da bateria (BAT0 ou BAT1)
    BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1)
    
    # Lê os dados em tempo real
    STATUS=$(cat /sys/class/power_supply/$BAT/status)
    CAPACITY=$(cat /sys/class/power_supply/$BAT/capacity)

    # A mágica acontece aqui: menor ou igual a 25% E descarregando
    if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le 25 ]; then
        notify-send -u critical "Bateria Fraca!" "Nível de energia em ${CAPACITY}%. Conecte o carregador ao seu Predator."
        sleep 300 # Espera 5 minutos antes de avisar de novo
    else
        sleep 60 # Dorme por 60 segundos e checa novamente
    fi
done
