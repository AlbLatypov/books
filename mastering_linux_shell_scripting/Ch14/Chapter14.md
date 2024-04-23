# Chapter 14. Using Python as a Bash Scripting Alternative

>#!/usr/bin/python3
>print ("hello")

### Pythonic arguments
We should know by now that we will want to pass command-line arguments to Python and
we can do this using the __argv__ array. However, we are more like bash; with Python we
combine the program name into the array with the other arguments.

The __argv__ array is a part of the __sys__ object
- sys.argv[0] is the script name
- sys.argv[1] is the first argument supplied to the script
- sys.argv[2] is the second supplied argument and so on
- The argument count will always be at least 1, so, keep this in mind when
checking for supplied arguments

>`#!/usr/bin/python3`\
>`import sys`\
>`print("text"+sys.argv[1])`

next one

>`#!/usr/bin/python3`\
>`import sys`\
>`count = len(sys.argv)`\
>`name=''`\
>`if ( count == 1):`\
>`   name = input ("Enter a name: ")`\
>`else:`\
>`   name = sys.argv[1]`
>
>`print ("hello " + name)`\
>`print ("Exiting " + sys.argv[0])`

>Остальной текст по работе с файлами python

## Python+AWK

Python и AWK можно использовать совместно, например, для преобразования и анализа данных в текстовых файлах. Вот пример, который демонстрирует, как использовать AWK из Python для фильтрации данных, а затем использовать Python для дальнейшего анализа:

`import subprocess`\

`# Используем AWK для фильтрации данных из файла data.txt`\
`awk_command = "awk '{if ($3 > 10) print $0}' data.txt"`\
`awk_process = subprocess.Popen(awk_command, shell=True, stdout=subprocess.PIPE)`\

`# Читаем данные, отфильтрованные AWK, и сохраняем их в список`\
`data_list = []`\
`for line in awk_process.stdout:`\
    `line = line.decode('utf-8').strip()`\
    `data_list.append(line)`

`# Закрываем процесс AWK`\
`awk_process.stdout.close()`\
`awk_process.wait()`

`# Анализируем данные с использованием Python`\
`total = 0`\
`for line in data_list:`\
    `fields = line.split()`\
    `total += int(fields[2])`

`print("Total:", total)`

В этом примере мы используем модуль subprocess для запуска команды AWK, которая фильтрует данные из файла data.txt и выводит строки, в которых третий столбец больше 10. Затем мы читаем отфильтрованные данные и сохраняем их в список. Наконец, мы анализируем данные с использованием Python, суммируя значения третьего столбца для каждой строки.

Обратите внимание, что мы используем опцию __shell=True__, чтобы запустить AWK в оболочке. Это может быть небезопасно, если данные, которые мы фильтруем, могут содержать специальные символы, которые могут быть интерпретированы оболочкой как команды. В этом случае мы можем использовать опцию __shell=False__ и передать команду AWK в виде списка аргументов, чтобы избежать ошибок и уязвимостей. Вот пример:

`import subprocess`

`# Используем AWK для фильтрации данных из файла data.txt`\
`awk_args = ['awk', '{if ($3 > 10) print $0}', 'data.txt']`\
`awk_process = subprocess.Popen(awk_args, stdout=subprocess.PIPE)`


В этом примере мы передаем команду AWK в виде списка аргументов, чтобы избежать ошибок и уязвимостей, связанных с интерпретацией оболочкой специальных символов в данных.
