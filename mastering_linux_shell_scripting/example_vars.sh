#!/bin/bash
name="Labert"
age=42
total=1.12
my_array=(one two 3 4 $USER)
echo "U are using $0"
echo "You are using $(basename $0)"
echo "Hello $name"
echo "Your age $age. Is there ageism in your company?"
echo "Total $total rubles"
echo ${my_array[2]}
echo ${my_array[1]}
echo ${my_array[4]}
echo ${my_array[*]} # all elements
unset my_array[1]   # delete elem
unset my_array      # delete array
echo ${my_array[*]}
exit 0
