#!/bin/sh

FILE=backup.sql.`date +"%Y%m%d"`	# Aqui se cria a variável FILE, que receberá o nome do arquivo de backup com a data do dia em que foi criado.
DBSERVER=127.0.0.1	                # Aqui se insere o endereço IP do servidor. No caso, o server é local e está no IP local.
# DBSERVER=localhost	            # Caso esteja configurado nos hosts da máquina, em vez do IP, pode-se utilizar o localhost.
DATABASE=database-name	            # Nessa linha, insere-se o nome da base de dados.
USER=user-name	                    # Aqui, insere-se o nome de usuário da base de dados: pode ser root.
PASS=your-password	                # Insere-se a senha do usuário inserido na linha anterior.

unalias rm 2> /dev/null             # Nessa linha e nas próximas duas, garante-se 
rm ${FILE} 2> /dev/null             # que não tenha um arquivo já com o nome criado 
rm ${FILE}.gz 2> /dev/null	        # na pasta em que o backup será feito.

mysqldump --opt --user=${USER}      # Executa-se então o programa mysqldump, que será 
\ --password=${PASS}                # responsável por executar o seu backup. Note que
\ ${DATABASE} > ${FILE}	            #  ele já usa as variáveis USER e PASS, criadas anteriormente.

gzip $FILE	                        # Comprime-se o arquivo com o Gzip.
echo "${FILE}.gz was created:"	    # Avisa-se o usuário que o arquivo foi criado.
ls -l ${FILE}.gz	                # Lista-se então o arquivo criado.