#!/bin/bash
#BDSTECNOSYSTEM

# Verifica se o Termux já está instalado
if [ ! -x "$(command -v termux-setup-storage)" ]; then
    echo "O Termux não está instalado. Por favor, instale o Termux e tente novamente."
    exit 1
fi

# Verifica e instala as dependências necessárias
if [ ! -x "$(command -v wget)" ] || [ ! -x "$(command -v tar)" ] || [ ! -x "$(command -v proot)" ]; then
    echo "Instalando dependências..."
    pkg update && pkg upgrade
    pkg install -y wget tar proot
fi

# Baixa o script de instalação do Kali Nethunter
echo "Baixando o script de instalação do Kali Nethunter..."
wget -O install-nethunter-termux https://offs.ec/2MceZWr

# Torna o script executável
chmod +x install-nethunter-termux

# Executa o script de instalação do Kali Nethunter
echo "Executando o script de instalação do Kali Nethunter..."
./install-nethunter-termux

# Verifica se a instalação foi concluída com sucesso
if [ -d "/data/local/nhsystem" ]; then
    echo "A instalação do Kali Nethunter foi concluída com sucesso!"
else
    echo "A instalação do Kali Nethunter falhou. Verifique as mensagens de erro acima e tente novamente."
fi
