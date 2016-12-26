#!/bin/bash

#---------------------------------------------------------
# Data: 26 de Dezembro de 2016
# Criado por: Juliano Santos [SHAMAN]
# Script: xget_termwin_size.sh
# Descrição: Monitora as dimensões da janela do terminal
# Página: http://www.shellscriptx.blogspot.com.br
# Fanpage: https://www.facebook.com/shellscriptx
#---------------------------------------------------------

# Associa a função ao evento 'WINCH' (Window Change)
trap 'ver_dimensao' WINCH

# Ocultando o cursor
tput civis

# Limpa a tela
clear

# Função
ver_dimensao()
{
	# Limpa a tela.
	clear 
	
	# Armazena as dimensões.
	COLUNAS=$(tput cols)	
	LINHAS=$(tput lines)

	# Coloca o cursor no centro na tela.
	tput cup $((LINHAS/2)) $((COLUNAS/2-2))

	# Imprime dimensão atual da janela.
	echo "${COLUNAS}x${LINHAS}"

	# Status 0
	return 0
}

# Aguarda os dados da função
while read; do :; done

exit 0
#FIM
