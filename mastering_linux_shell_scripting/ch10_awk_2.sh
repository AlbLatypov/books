#!/bin/bash

#сепаратор двоеточие, разделяет далее записи в строке
# awk ' BEGIN { FS=":" } { print $1,$3,$7 } ' /etc/passwd

#Печатает заголовки, определенной ширины для s-строк, и печатает
# вывод соответствующей ширины (d - числа). 
# Первое печатаем правила заголовка
# Второе то, что хотим в него вывести 
# awk 'BEGIN {FS=":" ;printf "%10s %4s %17s\n","Name","UID","Shell" }
# > { printf "%10s %4d %17s\n",$1,$3,$7 } ' /etc/passwd

# awk 'BEGIN{FS="\n"}{print $1,"FNR="FNR}' /etc/passwd

#FNR and NR
# awk 'BEGIN {FS="\n"} {print $1,"FNR="FNR,"NR="NR} END{print "Total lines:
# ",NR}' myfile myfile
