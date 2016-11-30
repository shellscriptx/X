#!/bin/bash

#-------------------------------------------------
# Data:        28 de Novembro de 2016
# Criado por:  Juliano Santos [SHAMAN]
# Script:      xswapcase.sh
# Descrição:   Inverte a formatação dos caracters.
# Página:      http://www.shellscriptx.com.br
# Github:      https://github.com/shellscriptx
#-------------------------------------------------

# Imprimindo alfabeto em minúsculo, realizando conversão intercalada para maiúsculo.
# Exemplo: aAbBcC...	
ORIGEM=$(printf '%s\n' {a..z} | awk '{printf "%s%s",$1,toupper($1)}')

# Imprimindo alfabeto em maiúsculo, realizando conversão intercalada para minúsculo.
# Exemplo: AaBbCc...
DESTINO=$(printf '%s\n' {A..Z} | awk '{printf "%s%s",$1,tolower($1)}')

# Transforma a cadeia de caracteres 'ORIGEM' em 'DESTINO'.
# Exemplo: a -> A, A -> a, b -> B, B -> b, c -> C, C -> c ...
sed "y/$ORIGEM/$DESTINO/" 

exit 0
#FIM
