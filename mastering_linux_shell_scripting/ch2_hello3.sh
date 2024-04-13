#!/bin/bash
# Пример использования ввода
# Автор: Латыпов А.Ф.
# Дата: 13.04.2024
echo -n "Hello $(basename $0)! Your name: "
read
echo "Hello $REPLY"
exit 0
