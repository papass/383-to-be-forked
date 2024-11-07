#!/bin/bash

num_groups=10

for ((i=1; i<=num_groups; i++))
do
    group_name="Группа_$i"
    mkdir -p "$group_name/Управление задачами/Документация"
    mkdir "$group_name/Управление задачами/Код"
    mkdir "$group_name/Управление задачами/Отчеты"
    mkdir "$group_name/Управление задачами/Код/Исходники"
    mkdir "$group_name/Управление задачами/Код/Скрипты"

    touch "$group_name/Управление задачами/Документация/Инструкция.txt"
    touch "$group_name/Управление задачами/Документация/Шаблоны задач/Шаблон1.txt"
    touch "$group_name/Управление задачами/Документация/Шаблоны задач/Шаблон2.txt"
    touch "$group_name/Управление задачами/Код/Исходники/main.c"
    touch "$group_name/Управление задачами/Код/Исходники/utils.c"
    touch "$group_name/Управление задачами/Код/Скрипты/setup.sh"
    touch "$group_name/Управление задачами/Код/Скрипты/run.sh"
    touch "$group_name/Управление задачами/Отчеты/Отчет1.doc"
    touch "$group_name/Управление задачами/Отчеты/Отчет2.doc"
done

echo "Создано 10 папок с заданной структурой."