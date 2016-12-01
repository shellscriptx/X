#!/bin/bash

#-----------------------------------------------------
# Data:        17 de Novembro de 2016
# Criado por:  Juliano Santos [SHAMAN]
# Script:      xgetethinfo.sh
# Descrição:   Obtem informações da interface de rede
# Página:      http://www.shellscriptx.blogspot.com.br
# Github:      https://github.com/shellscriptx
#-----------------------------------------------------

# Nome do script
SCRIPT=$(basename "$0")

# Lista os pacotes.
for pkg in ifconfig ip
do
	# Verifica se os arquivos estão presentes, caso
	# contrário imprime mensagem de erro e finaliza script.
	if ! which $pkg 1>/dev/null; then
		echo "$SCRIPT: erro: '$pkg' comando não encontrado." 1>&2
		exit 1
	fi
done

# Requer argumento
if [ ! $1 ]; then
	echo "$SCRIPT: erro: requer interface." 1>&2
	exit 1
# Testa se a interface existe.
elif ! ifconfig $1 &>/dev/null; then
	echo "$SCRIPT: erro: '$1' interface de rede não encontrada." 1>&2
	exit 1
fi

# Executa os comandos na interface especificada, armazenando as informações
IP=$(ifconfig $1 | awk '/inet / {print}' | cut -d':' -f2 | awk '{print $1}')
NETMASK=$(ifconfig $1 | awk '/inet / {print}' | cut -d':' -f4 | awk '{print $1}')
MAC=$(ifconfig $1 | egrep -o  '([a-f0-9]{2}:){5}[a-f0-9]{2}')
GATEWAY=$(ip route | grep "^default" | grep $1 | awk '{print $3}')

# Imprime na tela.
printf 'Interface: %s\n\n' $1
printf "%15s  %15s  %15s  %17s\n" IP Mascara Gateway MAC
printf "%15s  %15s  %15s  %17s\n" $IP $NETMASK $GATEWAY $MAC

exit 0
#FIM
