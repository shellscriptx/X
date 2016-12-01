#!/bin/bash

#------------------------------------------------------
# Data:        2 de novembro de 2016
# Criado por:  Juliano Santos [SHAMAN]
# Descrição:   Imprime tabela de cores
# Página:      http://www.shellscriptx.blogspot.com.br
# Github:      https://github.com/shellscriptx
#------------------------------------------------------

# Lista todos efeitos, cores do texto e fundo, gerando
# todas as combinações possiveis.
for efeito in 0 1 4 5 7 8
do
    for cor_texto in {30..37}
    do
        for cor_fundo in {40..47}
        do
			# Imprime somente os códigos da cor
            echo -n "\033[$efeito;$cor_texto;$cor_fundo "
			# Imprime texto com efeito
            echo -e "\033[$efeito;$cor_texto;${cor_fundo}m TEXTO \033[0m"
        done
    done
       # Imprime o resultado em colunas.
done | sed 'N;N;N;N;N;s/\n/ /g' 

#FIM
exit 0
