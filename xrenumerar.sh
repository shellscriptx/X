#!/bin/bash

#-------------------------------------------------
# Data:       5 de Dezembro de 2016
# Criado por: Julano Santos [SHAMAN]
# Script:     xrenumerar.sh
# Descrição:  Remove os itens indesejados e renumera
#             os itens da nova lista.
# Página:     http://www.shellscriptx.blogspot.com.br
# Github:     https://github.com/shellscriptx
#-------------------------------------------------

# Caminho do arquivo que contém os itens que deseja renumerar.
ARQ=./sistemas.txt

# indice
NUM=0

# Lê o arquivo e armazena em LINHA
while read LINHA
do
	# Incrementa o indice +1
	((NUM++))

	# Insere os zeros a esquerda do valor de NUM e armazena em COD.
	# Se o código possuir mais que 4 dígitos, basta alterar o valor
	# no formato do printf.
	COD=$(printf '%04d' $NUM)

	# Substitui o código do final da linha pelo novo.
	echo $LINHA | sed -r "s/[0-9]+$/$COD/"
	
	# Descomente se o código for no inicio da linha
	# echo $LINHA | sed -r "s/^[0-9]+/$COD/"
	

# Lê o arquivo ignorando as linhas que contém a palavra windows.
# Insira aqui as palavras que deseja excluir, separando-as por | (PIPE)
# (palavra1|palavra2|...)
done < <(grep -v 'Windows' "$ARQ")

exit 0
#FIM
