#!/bin/bash

#------------------------------------------------------------------
# Data:       2 de Janeiro de 2017
# Script:     xcriar_atalho.sh
# Descrição:  Cria atalho ou atalhos de programa(s) instalado(s).
# Criado por: Juliano Santos [SHAMAN]
# Página:     http://www.shellscriptx.blogspot.com.br
# Fanpage:    https://www.facebook.com/shellscriptx
#------------------------------------------------------------------

# Exibe ajuda caso o script seja executado sem argumentos.
[ ! "$*" ] && { echo "Uso: $0 [APLICATIVO]"; exit 0; }

# Nome do script
SCRIPT=$(basename "$0")

# Arquivo de configuração de diretórios 'XDG'
DIR_CONF=$HOME/.config/user-dirs.dirs

# Define o diretório destino
[ -e $DIR_CONF ] && DIR=$(eval echo $(sed -n '/XDG_DESKTOP_DIR/s/.*=//p' $DIR_CONF)) || DIR="$PWD"

# Lista todos os argumentos passados no script.
for BIN in $* 
do
	# Verifica se o binário existe, localizando seu diretório com base em seu nome ou caminho completo informado.
	# Caso não exista, imprime mensagem de erro e finaliza o script.
	if ! which "$BIN" &>/dev/null; then
		echo "$SCRIPT: '$BIN' não é um binário válido." 1>&2; exit 1; fi

	NOME=$(basename "$BIN")				# Extrai apenas o nome do binário
	ATALHO="$DIR/$NOME.desktop"		# Salva o caminho+nome, adicionando a extensão '.desktop'.
	
	# Cria o atalho inserindo as suas configurações.
	cat > "$ATALHO" << EOF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=$NOME
Exec=$BIN
Terminal=false
Type=Application
Icon=$NOME
EOF
# Final do arquivo

	# Aplica permissão para leitura e execução.
	chmod 755 "$ATALHO"

	# Imprime mensagem de êxito.
	echo "Atalho: '$ATALHO' criado com sucesso."
done

exit 0
# FIM
