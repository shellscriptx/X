#!/bin/bash

#-------------------------------------------------------
# Data:       20 de julho de 2016
# Criado por: Juliano Santos
# Script:     xdescanso_tela.sh
# Descrição:  Simulando descanso de tela para terminal.
# Página:     http://www.shellscriptx.blogspot.com.br
# Github:     https://github.com/shellscriptx
#--------------------------------------------------------

# Requer argumentos.
[[ $* ]] || { echo "Uso: $0 MENSAGEM"; exit 1; }

# Mensagem
MSG="$*"

# Reseta as configurações quando o script for finalizado.
trap 'tput reset' EXIT

# Define as coordenadas iniciais e direção.
c=1;x=1;y=1
yd="((y++))";xd="((x++))"

# Limpa conf e oculta cursor.
tput sgr0; tput civis

# Loop infinito
while true; do
	# Limpa a tela a cada ciclo
    clear					
    # Subtrai o número de colunas do comprimento da mensagem, obtendo a coordenada 
	# limite 'y' e alterando a direção do movimento quando o último caractere
	# chegar ao final da tela. evitando que mensagem ultrapasse os limites.
	xs=$(($(tput cols)-${#MSG}))						
	ys=$(($(tput lines)-1))							# Total de linhas -1
	tput setf $c									# Cor de fundo, armazenado em "$c"
    tput cup $y $x; echo -n "$MSG"					# Imprime a mensagem sem quebra de linha nas coordenadas "$y" e "$x"
	# Direções.										# Incrementa 'c = (cor)' sempre que houver alterações na direção.
    [ $y -ge $ys ] && { yd="((y--))"; ((c++)); }	# Se coordenada 'y' >= 'limite' muda operação de y para 'y--' (cima)
    [ $y -le 0 ] && { yd="((y++))"; ((c++)); }		# se coordenada 'y' <= 0 muda operação de y para 'y++' (baixo)
    [ $x -ge $xs ] && { xd="((x--))"; ((c++)); }	# Se coordenada 'x' >= 'limite' muda operação de 'x' para 'x--' (esquerda) 
    [ $x -le 0 ] && { xd="((x++))"; ((c++)); }		# Se coordenada 'x' <= 0 muda operação de 'x' para 'x++' (direita)
    [ $c -gt 7 ] && c=1								# Se cor > 7, reinicia o ciclo atribuindo o valor 1
    eval "$xd;$yd"									# Executa o modo atual de operações de 'x' e 'y' armazenados em 'xd' e 'yd'.
    sleep 0.1										# Tempo de 0.1 milesegundos entre os ciclos da tela.
done
# fim
