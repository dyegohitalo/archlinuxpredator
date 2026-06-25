#!/bin/bash

# Pega a hora e a data
TIME=$(date +"%H:%M")
DATE=$(date +"%d/%m/%Y")

# Extrai o dia em português e força a primeira letra a ser maiúscula com 'sed'
DAY=$(env LC_ALL=pt_BR.UTF-8 date +"%A" | sed 's/^\(.\)/\U\1/')

# Se não for Sábado nem Domingo, e ainda não tiver "feira", adiciona o sufixo
if [[ "$DAY" != "Sábado" && "$DAY" != "Domingo" && "$DAY" != *"feira"* ]]; then
    DAY="$DAY-feira"
fi

# Imprime o JSON final
echo "{\"text\": \"$TIME\", \"tooltip\": \"$DATE, $DAY\"}"
