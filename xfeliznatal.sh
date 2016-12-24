#!/bin/bash

#------------------------------------------------
# Data: 24 de Dezembro de 2016
# Script: xfeliznatal.sh
# Descrição: É NATAL :D
# Página: http://www.shellscriptx.blog.com.br
# Panpage: https://www.facebook.com/shellscriptx
# Criado por: Juliano Santos [SHAMAN]
# -----------------------------------------------

# Tamanho
COLUNAS=$(tput cols)
LINHAS=$(tput lines)

SCRIPT="$(basename $0)"

# Verifica as dimensões da janela.
if [ $COLUNAS -lt 80 -o $LINHAS -lt 15 ]; then
	echo "$SCRIPT: ajuste o tamanho da janela."
	echo "Atual: ${COLUNAS}x${LINHAS}"
	echo 'Recomendado: 80x15'
	exit 1
fi

# Verifica se o 'pv' está instalado.
test $(which pv) || { echo "$SCRIPT: pacote 'pv' requerido."; exit 1; }	

# Reseta as configurações se o script for finalizado pelo usuário.
trap 'tput reset; trap - INT; exit' INT

clear

# Título do blog com efeito de cores.
BLOG=('\033[1;37;40m SHELL \033[0;m\033[1;31mX\033[1;30;47m SCRIPT \033[0;m')

# Array contendo a mensagem.
MSG=(
'Se a tristeza bater, mande ela para "/dev/null".'
'Quando as coisas parecerem impossíveis, seja um "while true".'
'Se alguém disser que você não é capaz de executar uma coisa, dê um "chmod +x".'
'O dia que você tiver dúvidas, saiba que o "help" e o "man" estarão ao seu lado.'
'Conquiste o seu espaço registrando-o em "/etc/fstab".'
''
'Somente você pode "Scriptar" a sua história.'
''
'FELIZ NATAL E UM PRÓSPERO ANO NOVO !!!'
''
'by. SHAMAN'
''
'Carregando suas conquistas...'
)

# Array contendo as conquistas.
PLV=(
'SUCESSO' 'ALEGRIA' 'LINUX' 'CONHECIMENTO' 
'PROSPERIDADE' 'AMOR' 'PAZ' 'DEDICAÇÃO'
'OBJETIVO' 'COMANDOS' 'REALIZAÇÃO' 'DINHEIRO'
'VITÓRIA' 'CAFÉ' 'PROGRAMAÇÃO' 'SHELL SCRIPT'
'BASH' 'TERMINAL' 'SAÚDE' 'VIDA LONGA'
)

# Retorna a posição central da tela com base no número de caracteres
# na mensagem passada no parâmetro.
posx(){ echo $((($COLUNAS/2-1)-(${#1}/2))); }

# Move no sentido horizontal o título do blog.
for x in $(seq $(posx "SHELL SCRIPT X"))
do
	tput cup 2 $x	# Define a posição do cursor
	tput el1		# Apaga o inicio da linha.
	
	echo -e $BLOG	# Imprime o texto interpretando os caracteres de escape.
	sleep 0.1		# Intervalo do movimento.
done

# Lê os índices das mensagens
for i in $(seq 0 $((${#MSG[@]}-1)))
do
	# Centraliza o cursor
	tput cup $((4+$i)) $(posx "${MSG[$i]}")
	# Imprime a mensagem em negrito, aplicando efeito de digitação com 'pv'
	echo -en "\033[1;37m${MSG[$i]}\033[0;m" | pv -qL 15
done

sleep 2

# Oculta o cursor.
tput civis

clear

while :
do
	# Obtem o total de elementos do array conquista.
	T=$((${#PLV[@]}-1))
	
	# Define uma cor aleatoriamente.
	tput setf $(($RANDOM%7))
	# Define a posição do cursor aleatoriamente na tela.
	tput cup $(($RANDOM%$LINHAS)) $(($RANDOM%$COLUNAS))
	
	# Imprime o elemento de um índice aleatório.
	echo -n ${PLV[$(($RANDOM%$T))]}
	sleep 0.3	# Intervalo.
done
#FIM
