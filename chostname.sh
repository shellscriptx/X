#!/bin/bash

#-----------------------------------------------------
# Data:       12 de Novembro de 2016
# Criado por: Juliano Santos [SHAMAN]
# Script:     chostname.sh
# Descrição:  Altera o nome da máquina
# Página:     http://www.shellscriptx.blogspot.com.br
# Github:     https://github.com/shellscriptx
#-----------------------------------------------------

# Nome do script.
SCRIPT=$(basename "$0")

# Arquivos de configuração.
HOSTNAME=/etc/hostname
HOSTS=/etc/hosts
KERNEL=/proc/sys/kernel/hostname

# Salva o nome atual.
OLDNAME=$(hostname)

# Para realizar as alterações é preciso ser root.
if [ $UID -ne 0 ]; then
	echo "$SCRIPT: requer privilégios de root." 1>&2
	exit 1
# Requer argumento.
elif [ ! $1 ]; then
	echo "Uso: 'sudo $0 nome'" 1>&2
	exit 1
fi

# Altera os arquivos de configuração inserindo o novo nome.
if echo "$1" | tee $HOSTNAME $KERNEL 1>/dev/null && sed -i "s/\b$OLDNAME\b/$1/g" $HOSTS; then
	echo $SCRIPT': nome alterado com sucesso !!!'
else
	echo "$SCRIPT: erro ao tentar alterar nome." 1>&2
	exit 1
fi

exit 0
#FIM
