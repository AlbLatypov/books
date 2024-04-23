#!/bin/bash
# Пример использования ввода
# Автор: Латыпов А.Ф.
# Дата: 13.04.2024
while [ -n "$1" ]
do
case "$1" in
-a) echo "-a option used" ;; 
-c) echo "-c option used" ;; 
-b) echo "-b option used" ;;
*) echo "Option $1 not an option" ;;
esac
shift
done
echo "this is $2"
