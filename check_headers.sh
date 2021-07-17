#!/bin/bash
#Скрипт мониторина web сервера по заголовкам
#Надо передать скрипту url в виде аргумента
a=`curl -I -s -L /dev/null http://$1 | grep HTTP | mawk '{print $2}'`
b=`echo $a | mawk '{print $NF}'` #Редирект скидывает несколько значений заголовков, NF это выбор последнего значения
if [[ $b -eq 200 ]]; then
    echo "Успешный запрос"
    exit 0
elif [[ $b -eq 404 ]]; then
    echo "Страница не найдена"
    exit 1
elif [[ $b -eq 503 ]]; then
    echo "Cервис недоступен"
    exit 2
else echo "Другой код состояния http"
fi
