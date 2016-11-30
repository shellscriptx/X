#!/bin/bash

#----------------------------------------------
# Data:         30 de Novembro de 2016
# Criado por:   Juliano Santos [SHAMAN]
# Script:       xcpf.sh
# Desrcrição:   Realiza validação do CPF.
# Página:       http://www.shellscriptx.com.br
# Github:       https://github.com/shellscriptx
#----------------------------------------------

# Uso: echo CPF | ./xcpf.sh

# Armazena o valor da entrada padrão
CPF=$(cat /dev/stdin)

# Insere sinal negativo invalidando o cpf que conter
# todos os dígitos '0'.
CPF=${CPF/000.000.000-00/-$CPF}

# Verifica se o cpf informado se enquandra no formato estabelecido.
# Formato: xxx.xxx.xxx-xx
if ! echo $CPF | egrep -q '^([0-9]{3}[.]){2}([0-9]{3}[-])[0-9]{2}$'; then
	# ERRO 
	# Imprime mensagem de erro
	echo "$FUNCNAME: '$CPF' Formato inválido." 1>&2
	echo 'Exemplo: xxx.xxx.xxx-xx'
	
	# Finaliza função.
	# Código: 2
	# Descrição: Formato inválido.
	exit 2
fi
	
# Remove os caracteres '.' e '-'; insere um espaçamento entre os dígitos e 
# inicializa o array armazenando um dígito por índice.
# Exemplo: 731xxxxxxxx
# 		   NUM[0]=7, NUM[1]=3, NUM[2]=1, ...
NUM=($(echo $CPF | sed 's/[.-]//g;s/./& /g'))

# Soma-se os resultados da multiplicação de todos os dígitos.
VAL=$(((${NUM[0]}*10)+(${NUM[1]}*9)+(${NUM[2]}*8)+ \
	   (${NUM[3]}*7)+(${NUM[4]}*6)+(${NUM[5]}*5)+ \
	   (${NUM[6]}*4)+(${NUM[7]}*3)+(${NUM[8]}*2)))
	
# Se o resto da divisão de 'VAL' por '11' 
# for menor que 2, salva o valor '0' em 'DV[1]', caso
# contrário, salva o resto da divisão subtraido por 11.
# No final, teremos o 1º dígito verificador armazenado em  DV[1].
[ $(($VAL%11)) -lt 2 ] && DV[1]=0 || DV[1]=$((11-($VAL%11)))

# Soma-se os resultados da multiplicação de todos os dígitos
# mais o 1º dígito verificador multiplicado por 2.
VAL=$(((${NUM[0]}*11)+(${NUM[1]}*10)+(${NUM[2]}*9)+ \
	   (${NUM[3]}*8)+(${NUM[4]}*7)+(${NUM[5]}*6)+ \
	   (${NUM[6]}*5)+(${NUM[7]}*4)+(${NUM[8]}*3)+(${DV[1]}*2)))

# Obtem o 2º dígito verificador 
[ $(($VAL%11)) -lt 2 ] && DV[2]=0 || DV[2]=$((11-($VAL%11)))
	
# Se o 1º dígito verificador for igual ao 8ª Dígito do CPF e
# se o 2º dígito verificador for igual ao 9º dígito do CPF
# Finaliza script.
# Código: 0
# Descrição: CPF Válido.
[ ${DV[1]} -eq ${NUM[9]} -a ${DV[2]} -eq ${NUM[10]} ] && exit 0

# Caso contrário.
# Finaliza script.
# Código: 1
# Descrição: CPF inválido.
exit 1

#FIM
