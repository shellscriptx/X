#!/bin/bash

# ----------------------------------------------------------------------
# Data:         24 de Outubro de 2016
# Script:       xconta_arquivo.sh
# Criado por:   Juliano Santos [SHAMAN]
# Descrição: 	Conta o total de arquivos em um diretório por extensão.
# Página:       http://www.shellscriptx.blogspot.com.br
# Fanpage:      https://www.facebook.com/shellscriptx
# Github:       https://github.com/shellscriptx
# ----------------------------------------------------------------------

# Declarando um array por referencia, onde os índices receberam o nome do tipo do arquivo.
declare -A EXT

# Verifica se o script foi executado sem argumento.
if [ ! "$1" ]; then
	# Se nenhum argumento foi passado, imprime a mensagem de uso.
	echo "Uso: $0 <diretorio>" 1>&2
	exit 1	# Finaliza o script.

# Se o script foi executado com argumento, verifca se o mesmo é um diretório válido.
elif [ ! -d "$1" ]; then
	# Se não for, imprime a mensagem de erro.
	echo "$0: erro: diretório não encontrado" 1>&2
	exit 1  # Finaliza o script.
fi

# Mensagem de progresso.
echo Calculando ...

# Inicia o loop que recebe a entrada do 'Descritor de arquivo' gerado pelo comando 'find'
while read FILE
do
	# Inicia o índice da variavel com o  nome da extensão do arquivo e incrementa o seu valor
	# Exemplo:
	# 	FILE = music.mp3
	#   VARIAVEL = EXT[mp3]=EXT[mp3]+1
	((EXT[${FILE##*.}]++))	
	# Executa o find com uma expressão regular, onde somente os arquivos com extensão são listados.
done < <(find "$1" -type f -regextype egrep -regex '^.*\.\w+$' 2>/dev/null)

# Cabeçalho
printf '%10s %10s\n' "Extensão" "Total"

# Lê os índices da variável 'EXT'.
# Os índices são as extensões dos arquivos encontrados.
for ext in ${!EXT[@]}
do
	# Aplica a tabulação de saida, imprimindo os valores de cada índice.
	printf '%10s %10s\n' "$ext" "${EXT[$ext]}"
	# A variavel recebe o total de arquivos encontrados por extensão.
	TOTAL+='+'${EXT[$ext]}	# Monta a operação de soma inserindo o sinal de adição no inicio de cada valor.
							# Exemplo:
							#
							# EXT[mp3]=2
							# EXT[doc]=3
							# EXT[txt]=10
							# EXT[iso]=20
							# EXT[mov]=5
							#
							# TOTAL =+2+3+10+20+5
done

# Radapé
printf '\nDiretório base: %s\n' "$1"
printf 'Total de arquivos: %d\n' $((TOTAL))  # Realiza a soma dos valores 

exit 0 #FIM
