#!/bin/bash

#---------------------------------------------------------------
# Data:         29 de Novembro de 2016
# Criado por:   Juliano Santos [SHAMAN]
# Script:       xsenha_complexa.sh
# Descrição:    Verifica os requisitos de complexidade de senha
# Página:       http://www.shellscriptx.com.br
#---------------------------------------------------------------

checar_complex()
{
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

		# Finaliza a função com status: 0
		return $RETVAL
	else
		# FALHA
		# Armazena o retorno do comando
		RETVAL=$?
		
		# Mensagem de erro
		echo 'A senha não atende aos requisitos de complexidade' 1>&2

		# Finaliza a função com status: 1
		return $RETVAL
	fi
}

# Exibe o prompt da senha, desativa o echo dos dados de entrada e armazena em 'SENHA'
read -sp 'Senha: ' SENHA

# Testa a complexidade redirecionando a senha para entrada da função.
echo $SENHA | checar_complex

# Retorno da função
#
# 0 - Complexa
# 1 - Nâo complexa
[ $? -eq 0 ] || exit 1	# Finaliza script se a senha não for complexa.

echo 'Senha armazenada com sucesso !!!'

exit 0
# FIM


