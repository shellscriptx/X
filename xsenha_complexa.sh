#!/bin/bash

#---------------------------------------------------------------
# Data:         29 de Novembro de 2016
# Criado por:   Juliano Santos [SHAMAN]
# Script:       xsenha_complexa.sh
# Descrição:    Verifica os requisitos de complexidade de senha
# Página:       http://www.shellscriptx.com.br
#---------------------------------------------------------------

# A Função verifica a senha informada aplicando
# uma expressão regular em Perl que força atender
# aos seguintes requisitos de complexidade:
# Mínimo 8 caracteres.
#  ""    1 caractere minúsculo.
#  ""    "    ""     maiúsculo.
#  ""    "    ""     caractere especial.
#  ""    "  dígito de 0 à 9
if grep -qP '^.*(?=.{8,})(?=.*[A-Z])(?=.*\d)(?=.*\W)(?=.*[a-z]).*$'; then
	# SUCESSO
	# Armazena o retorno do comando.
	RETVAL=$?
	
	# Mensagem de êxito
	echo 'OK'
	# Finaliza script com status: 0
	exit $RETVAL
else
	# FALHA
	# Armazena o retorno do comando
	RETVAL=$?
	
	# Mensagem de erro
	echo 'A senha não atende aos requisitos de complexidade' 1>&2
	# Finaliza script com status: 1
	exit $RETVAL
fi

exit 0
# FIM


