#!/bin/bash

# Mata processos anteriores para evitar duplicatas
pkill waybar
pkill dunst
pkill awww-daemon

# Pequena pausa para garantir que tudo fechou
sleep 0.5

# Inicia os serviços
awww-daemon &
sleep 0.3
awww img /home/development/wallpapers/predator_cosmic.png --transition-type wipe &
waybar &
dunst &
/usr/lib/polkit-kde-authentication-agent-1 &
