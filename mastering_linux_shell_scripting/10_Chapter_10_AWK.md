# AWK Fundamentals

## Displaying and filtering content from files
`see script ch10_awk_1.sh`

## AWK variables

- __FIELDWIDTH__: Specifies the field width
- __RS__: Specifies the record separator
- __FS__: Specifies the field separator
- __OFS__: Specifies the output separator, which is a space by default
- __ORS__: Specifies the output separator
- __FILENAME__: Holds the processed file name
- __NF__: Holds the line being processed
- __FNR__: Holds the record which is processed
- __IGNORECASE__: Ignores character case

`see ch10_awk_2.sh`

#### Отличие FNR от NR

FNR (File Record Number) и NR (Number of Records) являются специальными переменными в AWK, которые содержат информацию о текущей строке и числе обработанных строк. У них есть несколько различий:

- FNR показывает номер строки в текущем файле. Он сбрасывается на 1 для каждого нового файла, если вы обрабатываете несколько файлов. NR же показывает общее число обработанных строк со начала выполнения программы AWK, независимо от файлов. Например, после обработки трех файлов, содержащих две, четыре и еще две строки соответственно, FNR будет равняться 3 (третьей строке в текущем файле), а NR - 9 (всего обработанных строк).
FNR полезен, когда вы обрабатываете несколько файлов и хотите сделать что-то особенное для первой строки каждого файла или когда нужно сравнить строки из разных файлов по их номерам. 

- NR же показывает общее количество строк, обработанных с начала выполнения программы, что может быть полезно, когда вам нужно, например, вывести среднее арифметическое или выполнить какое-то действие после определенного числа строк.

    Если вы используете NR в цикле for (например, `for (i=1; i<=NR; i++))`, то он будет работать для каждой строки во всех файлах, в отличие от FNR, который сбрасывается для каждого нового файла.

Вот пример, который показывает разницу между FNR и NR. Создайте файлы file1.txt и file2.txt со следующим содержимым:

>file1.txt:
>
>one
>two
>three

>file2.txt:
>
>four
>five
>six

Затем выполните следующую команду awk:

`awk 'FNR==1 {print "FNR for file " FNR ": " $0}; NR==1 {print "NR for file " FNR ": " $0}' file1.txt file2.txt`

Вывод будет следующим:

FNR for file 1: one
NR for file 1: one
FNR for file 2: four
NR for file 2: four

Как можно видеть, FNR для первой строки каждого файла равен 1, в то время как NR увеличивается для каждой строки во всех файлах.


## User-defined variables

>You can define the variable using any text, but it __MUST not start with numbers__

$ awk '
BEGIN{
var1=2
var2=3
var3=var1+var2
print var3
}'

$ awk '
BEGIN{
str1="Welcome "
str2=" To shell scripting"
str3=str1 str2
print str3
}'

## Conditional statements

#### if command

>Assume you have the following file:
50
30
80
70
20
90
Now, let's filter the values:

`awk '{if ($1 > 50) print $1}' myfile`

`awk '{if ($1 > 50) print $1 * 2;
 else print $1 * 3}' myfile`

 #### while loops
 >AWK processes every line of your file, but what if you want to iterate over the fields of each
line itself?

В AWK можно использовать цикл while для выполнения повторяющихся действий. Вот пример использования цикла while в AWK одной строкой:

`echo -e "1\n2\n3\n4\n5" | awk '{ sum = 0; i = $1; while(i) { sum += i; i-- }; print sum }'`

В этом примере мы передаем строки, содержащие числа от 1 до 5, в AWK. Для каждой строки, переменная i устанавливается равной значению в строке ($1), затем выполняется цикл while, который уменьшает i на 1 на каждой итерации и добавляет i к sum. В итоге, для каждой строки выводится сумма всех чисел от 1 до значения в строке.

Например, для строки "4", сумма будет равна 10, потому что 4 + 3 + 2 + 1 = 10.

>Другой пример из книги
awk '{
total = 0
i = 1
while (i < 4)
{
total += $i
i++
}
mean = total / 3
print "Mean value:",mean
}' myfile

#### for loops

`echo -e "1\n2\n3\n4\n5" | awk '{ sum = 0; for(i = 1; i <= $1; i++) { sum += i }; print sum }'`

`awk 'BEGIN { FS="\n"; OFS=" " } { for (i=1; i<=NF; i++) print $i }' numbers.txt`

>Если в файле numbers.txt записаны числа, разделенные >пробелами, например:
>
>56 74 89 112 93
>
>То после выполнения указанной команды вы получите >следующий вывод:
>
>56 74 89 112 93


## Formatting output

We have remained faithful to the __print__ command so far, as we have been limited in what
we require from the output. If we want to print out, say, the username, UID, and default
shell, we need to start formatting the output just a little. In this case, we can organize the
output in well-shaped columns. Without formatting, the command we use will look similar
to the following example, where we use commas to separate the field that we want to print:
`awk ' BEGIN { FS=":" } { print $1,$3,$7 } ' /etc/passwd`

`echo -e "John\nDoe\n25" | awk '{ printf "%-10s", $1 } END { print "" }'`

В этом примере мы передаем строки, содержащие имя "John", фамилию "Doe" и возраст "25", в AWK. Затем мы используем функцию printf для вывода каждого значения с шириной поля 10 символов и выравниванием по левому краю (%-10s). В конце мы добавляем новую строку для красивого вывода.

Результат будет выглядеть так:

John      
Doe       
25        

Каждое значение выводится в отдельной строке с шириной поля 10 символов, выровненной по левому краю.

Еще пример:

Вы можете добавить заголовок к вашему форматированному выводу AWK, используя функцию printf для печати заголовка, а затем перебирая строки в вашем файле. Вот пример с тем же файлом /etc/passwd, который добавляет заголовок "User UID/GID" перед таблицей:

`awk 'BEGIN { FS=":"; OFS="\t" } { if (NR==1) { printf("User\tUID/GID\n") } printf("%-8s %-8s\n", $1, sprintf("%d/%d", $3, $4))}' /etc/passwd`

Вывод будет таким:

User    UID/GID
root    0/0
daemon  1/1
bin     2/2
sys     3/3
sync    4/4
games   5/6
man     7/7
lp      8/-2
mail    9/-2
news    10/11
uucp    11/12
operator        12/12
backup  13/13
list    14/14
irc     15/15
gopher  16/16
ftp     17/18
nfsu    18/19
nobody  19/20

Если NR равен 1 (т.е. это первая строка), мы печатаем заголовок. Для всех остальных строк мы печатаем данные в нашем формате таблицы.

## Further filtering to display users by UID

We have been able to build our skills with AWK, piece by piece, and what we have learned
has been useful. We can take these tiny steps and add them to start creating something a
little more usable. Perhaps we want to print just standard users; these are usually users
higher than 500 or 1,000 depending on your particular distribution.
On the Linux Mint distribution that I am using for this book, standard users start with UID
_1000_. The UID is the third field. This is really a simple matter of using the value of the third
field as the range operator. We can see this in the following example:

`awk -F":" '$3 > 999 ' /etc/passwd`
`awk -F":" '$3 < 101 ' /etc/passwd`

## AWK control files
Just as with __sed__, we can simplify the command line by creating and including control files.
This also makes editing the command later more easily achievable. The control files contain
all the statements that we want __AWK__ to execute. The main thing that we must consider with
_sed_, _awk_, and shell scripts is modularization; creating reusable elements that can be used to
isolate and reuse the codes. This saves us time and work and we get more time for the tasks
that we enjoy.
To see an example of an _awk_ control file, we should revisit the formatting of the __passwd__ file.
Creating the following file will encapsulate the _awk_ statements:

`function green(s) {`
`    printf "\033[1;32m" s "\033[0m\n"`
`}`
`BEGIN {`
`    FS=":"`
`    green("    Name:    UID:         Shell:")`
`}`
`{`
`    printf "%10s %4d %17s\n", $1,$3,$7`
`}`

save to file this code `passwd.awk`

Being able to encompass all _awk_ statements in the one file is very convenient and the
execution becomes clean and tidy:

`awk -f ch10_passwd.awk /etc/passwd`

## Built-in functions

In the previous example, we defined a function called _green_. This leads into taking about
some built-in functions that come with _awk_.
AWK comes with many built-in functions such as mathematical functions:

- sin (x)
- cos (x)
- sqrt (x) 
- exp (x)
- log (x)
- rand (x)

You can use them like this:
`awk 'BEGIN{x=sqrt(5); print x}'`

Also, there are built-in functions that can be used in string manipulation:
`awk 'BEGIN{x = "welcome"; print toupper(x)}'`

