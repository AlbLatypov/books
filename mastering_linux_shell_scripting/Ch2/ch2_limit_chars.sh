#!/bin/bash
# Пример использования ввода
# Автор: Латыпов А.Ф.
# Дата: 13.04.2024
read -p "May I ask your name: " name
echo "Hello $name"
read -n1 -p "Press any key to exit"
echo
exit 0
