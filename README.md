# [X] (http://www.shellscriptx.com.br)

## 1. [xsenha_complexa.sh](https://github.com/shellscriptx/X/blob/master/xsenha_complexa.sh)

## Descrição
 
O xsenha_complexa.sh utiliza uma expressão regular em perl para testar o nível de uma senha na entrada padrão. Nenhuma máscara é aplicada para ocultar a senha, pois o procedimento constitui apenas em validá-la.

A senha deverá atenter os seguintes critérios de complexidade:

| Requerimentos mínimos|
|---------------------------------|
|8 caracteres|
|1 caractere minúsculo|
|1 caractere maiúsculo|
|1 dígito de 0 à 9|
|1 caractere especial|

## Uso

Após a conclusão do download, vá até o diretório onde o script foi salvo e aplique a permissão de execução, executando o comando abaixo:

```
chmod +x xsenha_complexa.sh
```

Para verificar o nível de complexidade basta redirecionar a senha para entrada padrão do script.

##### Exemplo:

```
echo "senha" | ./xsenha_complexa.sh
```
_O script irá verificar os critérios de complexidades descritos na regex em perl e irá retornar uma mensagem de erro ou sucesso._

**Código de retorno**

Código|Descrição
---------|-------------
0| Sucesso
1| Erro

## Desenvolvido por
> Juliano Santos [SHAMAN]

## Bugs
> Reporte possíveis erros enviando email para <shellscriptx@gmail.com>

---

## 2. [xcpf.sh](https://github.com/shellscriptx/X/blob/master/xcpf.sh)

## Descrição

O script verifica se o número do CPF informado é veradeiro ou falso, aplicando uma matemática simples que utiliza os dois últimos dígitos como validador.

**Código de retorno:**

Código|Descrição
---------|-------------
0|CPF válido
1|CPF inválido
2|O formato do CPF é inválido

## Uso

Após a conclusão do download, vá até o diretório onde o script foi salvo e aplique a permissão de execução, executando o comando abaixo:
```
chmod +x xcpf.sh
```

Envie o número do CPF para entrada padrão do script.

**Exemplo:**

Considere o número hipotético abaixo:

```
echo '143.389.234-53' | ./xcpf.sh
```
_O formato da mascára do CPF deverá respeitar o seguinte critério: **xxx.xxx.xxx-xx**_

## Desenvolvido por
> Juliano Santos [SHAMAN]

## Bugs
> Reporte possíveis erros enviando email para <shellscriptx@gmail.com>
***
## 3. [xchostname.sh](https://github.com/shellscriptx/X/blob/master/xchostname.sh)

## Descrição
O script realiza alteração do nome da máquina sem requerer a reinicialização do sistema para que as alterações tenham efeito.

**Arquivos alterados:**

- [x] /etc/hostname
- [x] /etc/hosts
- [x] /proc/sys/kernel/hostname

## Uso

Após a conclusão do download, vá até o diretório onde o script foi salvo e aplique a permissão de execução, executando o comando abaixo:
```
chmod +x xchostname.sh
```

Para alterar o nome da máquina basta executar o comando a seguir:
```
sudo ./xchostname.sh novo_nome
```
_É necessário executar o scritpt com privilégios administrativos._
## Desenvolvido por
> Juliano Santos [SHAMAN]

## Bugs
> Reporte possíveis erros enviando email para <shellscriptx@gmail.com>
***