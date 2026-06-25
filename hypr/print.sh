#!/bin/bash
sleep 0.5

# Cria a pasta com o nome exato em português (as aspas garantem que os espaços funcionem)
mkdir -p "$HOME/Imagens/Capturas de Telas"

# Define o nome exato do arquivo com a data no novo diretório
ARQUIVO="$HOME/Imagens/Capturas de Telas/print_$(date +'%d-%m-%Y_%H-%M-%S').png"

# Captura a tela, salva no disco e copia para a área de transferência
grim -g "$(slurp)" - | tee "$ARQUIVO" | wl-copy

# Dispara a notificação flutuante com a miniatura do print
notify-send -i "$ARQUIVO" "Captura de Tela" "Imagem salva em Capturas de Telas e copiada!"
