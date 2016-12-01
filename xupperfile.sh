#!/bin/bash

#-----------------------------------------------------
# Data:        22 de Novembro de 2016
# Criado por:  Juliano Santos [SHAMAN]
# Script:      xupperfile.sh
# Descrição:   Renomeia arquivos de um diretório,
#              convertendo nome para maiúsculo.
# Página:      http://www.shellscriptx.blogspot.com.br
# Github:      https://github.com/shellscriptx
#-----------------------------------------------------

# Requer argumento
if [ ! "$*" ]; then
	echo "Uso: $0 <diretorio>" 1>&2
	exit 1
fi

# Inicializa uma variável upper case
declare -u UFILE

# Lista recursivamente os arquivos do diretório passado no argumento,
# ignorando arquivos ocultos.
find "$*" -type f -regextype egrep  ! -regex '^\.\/\..*|.*\/\..*' -printf '%f\n' |  \
	# Lê a entrada padrão
	while read FILE
	do
		EXT="${FILE##*.}"		# Armazena extensão do arquivo atual
		EXT="${EXT/$FILE/}"		# Se o arquivo não possuir extensão, limpa a variável.
		UFILE="${FILE%%.*}"		# Remove a extensão e armazena o nome do arquivo.
		
		# Move o arquivo renomeando para MAIÚSCULO.
		# Se o arquivo possui extensão, insere o ponto antes.
		mv -vn "${*/%\/}/$FILE" "${*/%\/}/$UFILE${EXT:+.$EXT}"	
done
#FIM
