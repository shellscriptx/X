#!/bin/bash

#---------------------------------------------------------------------------------
# Data:        28 de Dezembro de 2016
# Script:      xmodelo_script.sh
# Descrição:   Gera um template contendo um cabeçalho com informações do projeto.
# Criado por:  Juliano Santos [SHAMAN]
# Página:      http://www.shellscriptx.blogspot.com.br
# Panpage:     https://www.facebook.com/shellscriptx
#---------------------------------------------------------------------------------

# Nome do script
SCRIPT=$(basename "$0")

# Sem erros
ERR=0

echo 'Criar modelo'
echo

# Lê os dados
read -p 'Script: ' NSCRIPT
read -p 'Descrição: ' DESCRICAO
read -p 'Site: ' SITE

# Remove a extensão do arquivo se ela existir.
# adiciona a extensão 'sh' e armazena o caminho/nome do script.
ARQUIVO="${PWD}/${NSCRIPT%%.*}.sh"

#-----------------ESTRUTURA CONDICIONAL--------------------

# Verifica se há campos vazios.
if [ -z "$SCRIPT" -o -z "$DESCRICAO" -o -z "$SITE"  ]; then
 echo "$SCRIPT: todos os campos são obrigatórios."
 # Erro
 ERR=1
# Requerimento mínimo de caracteres para descrever a função do script.
elif [ ${#DESCRICAO} -lt 20 ]; then
 echo "$SCRIPT: a descrição precisa ter no mínimo 20 caracteres."
 # Erro
 ERR=1
# Testa se o arquivo de script já existe. 
elif [ -e "$ARQUIVO" ]; then
 echo "$SCRIPT: '$ARQUIVO' arquivo já existe."
 # Erro
 ERR=1
# Cria lista negada com '!'.
# Expressão regular que valida se o endereço informado é uma url válida.
# O endereço precisa iniciar com 'http://', sendo que a expressão 'www' é opcional e 
# termine com qualquer um dos dominios: '.com', '.com.br', '.net' ou '.org'.
elif [[ ! $SITE =~ ^http://(www\.)?[a-zA-Z0-9_-]+\.(com\.br|com|net|org)$ ]]; then
 echo "$SCRIPT: '$SITE' endereço inválido."
 # Erro
 ERR=1
fi

# Verifica o valor de 'ERR'
# 0 - OK
# 1 - Erro (Finaliza o script)
if [ $ERR -eq 1 ]; then
 echo 'Finalizando...'
 exit 1
fi

#-----------------------------------------------------------
# Cria o arquivo e monta o cabeçalho com os dados informados.
cat > "$ARQUIVO" << EOF
#!/bin/bash

#-----------------------------------------------------------------
# Data        $(date +%c)
# Script:     $(basename $ARQUIVO)
# Descrição:  $DESCRICAO
# Criado por: $USER
# Página:     $SITE
#-----------------------------------------------------------------

# --> SEU CÓDIGO COMEÇA AQUI <--
EOF

# Teste o código de retorno para constatar se o arquivo foi criado ou não
if [ $? -eq 0 ]; then
 echo "$SCRIPT: script criado com sucesso."
 # Dá permissão de execução para o script criado.
 chmod +x "$ARQUIVO"  
else
 echo "$SCRIPT: não foi possível criar o arquivo."
fi

#FIM

