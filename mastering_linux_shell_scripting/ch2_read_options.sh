#!/bin/bash
# Пример использования ввода
# Автор: Латыпов А.Ф.
# Дата: 13.04.2024
while [ -n "$1" ]
do
case "$1" in
-a) echo "-a option passed";; 
-b) param="$2"
echo "-b option passed, with value $param"
shift ;;
-c) echo "-c option passed";;
--) shift
break ;;
*) echo "option $1 not and option";;
esac
shift
done
num=1
for param in "$@"
do
echo "#$num: $param"
num=$(( $num + 1 ))
done
