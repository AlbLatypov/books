# Regular Expressions

In this chapter, we will talk about the most mysterious part of using _stream editor_ (sed) and
AWK. They are regular expressions, or regexes for short. In the previous chapters, we
discussed some regular expressions shyly and that's because we don't need to dig into them
without a good understanding.

>There are two types of regex engine in Linux:
>- The Basic Regular Expression (BRE) engine
>- The Extended Regular Expression (ERE) engine\
>Most Linux binaries understand both engines, such as sed and AWK.

#### To start with, what are regular expressions?
Regular expressions are strings that the regex engine interprets to match a specific text. It's
like an advanced way of searching.

#### And what is the regex engine?
The regex engine is the piece of software that understands these strings and translates them
to find the matched text.

## Defining BRE patterns
To define a regex pattern, you can type the following:
`$ echo "Welcome to shell scripting" | sed -n '/shell/p'`
`$ echo "Welcome to shell scripting" | awk '/shell/{print $0}'`
output:
`Welcome to shell scripting`

__You must escape them with a backslash because these characters are
special characters for the regex engines.__
`. * [ ] ^ $ { } \ + ? | ()`

`sudo awk '!/^#/ && NF{print $0}' /etc/ssh/sshd_config`
`NF - не выводить пустные строки`
`! - не ^ - начинаются # - символ`

`$ awk '/[mbr]ash/{print $0}' myfile`
`$ sed -n '/[mbr]ash/p' myfile`
`[mbr] [wW]- any symbol of mbr wW`

`sudo awk '/^[pP]ort/' /etc/ssh/sshd_config` - contains and start pP

### Ranges of characters
You can specify a range of characters to match between square brackets as follows:

[a-d]
[0-9]
[d-hm-z]
[a-zA-Z]

`$ awk '/[d-hm-z]ash/{print $0}' myfile`
`$ sed -n '/[d-hm-z]ash/p' myfile`

## Special character classes
> - `[[:alpha:]] Matches any alphabetical character`
> - `[[:upper:]] Matches A-Z uppercase only`
> - `[[:lower:]] Matches a-z lowercase only`
> - `[[:alnum:]] Matches 0-9, A-Z, or a-z`
> - `[[:blanc:]] Matches space or Tab only`
> - `[[:space:]] Matches any whitespace character: space, Tab, CR`
> - `[[:digit:]] Matches from 0 to 9`
> - `[[:print:]] Matches any printable character`
> - `[[:punct:]] Matches any punctuation character`

`$ awk '/[[:upper:]]/{print $0}' myfile`
`$ sed -n '/[[:upper:]]/p' myfile`

#### Вывод строк с условием начало [Pp], окончание - цифры


`awk '/^[Pp].*[0-9]+$/' myfile`

Здесь:


`^` обозначает начало строки.
`[Pp]` указывает, что строка должна начинаться с "P" или "p".
`.*` означает любое количество любых символов (включая ноль символов). Это позволяет иметь любые символы между начальной буквой и окончательными цифрами.
`[0-9]+` обозначает одну или несколько цифр. [0-9] соответствует любой цифре, а `+` говорит, что таких цифр должна быть хотя бы одна.
`$` обозначает конец строки.

`echo "Checking colors" | awk '/colou*rs/{print $0}'`
`/colou*rs/` — это регулярное выражение. В регулярных выражениях символ * означает "ноль или более вхождений предшествующего элемента". В данном случае `u*` означает __"ноль или более вхождений символа u"__. Таким образом, это выражение соответствует как "colors", так и "colours" (и любой вариации с дополнительными буквами u, например "colouuurs").

#### The question mark
`echo "tt" | awk '/to?t/{print $0}'`
`echo "tt" | awk '/t[oa]?t/{print $0}'`
`echo "tot" | sed -r -n '/to?t/p'`
`echo "tt" | sed -r -n '/t[oa]?t/p'`

`/to?t/` — это регулярное выражение, где `?` означает __"ноль или одно вхождение предшествующего элемента"__. В данном случае это означает, что o может отсутствовать или встречаться один раз. Таким образом, шаблон соответствует как `"tt"`, так и `"tot"`.
`{print $0}` — действие, которое выполняется для строк, соответствующих регулярному выражению. $0 обозначает весь входящий текст (в данном контексте — каждую строку, которая поступает на вход awk). Если строка соответствует шаблону, то она выводится.

#### The plus sign

`echo "tt" | awk '/to+t/{print $0}'`
`echo "tot" | sed -r -n '/to+t/p'`

`/to+t/` — это регулярное выражение, где `+` означает __"одно или более вхождений предшествующего элемента"__. В данном случае это означает, что символ o должен встречаться хотя бы один раз перед t. Таким образом, шаблон соответствует строкам вида "tot", "toot", "tooot" и так далее, но не соответствует строке "tt", потому что в ней отсутствует o.

#### Curly braces
`echo "tt" | awk '/to{1}t/{print $0}'`
`echo "toot" | sed -r -n '/to{1}t/p'`

Команда `echo "tt" | awk '/to{1}t/{print $0}'` пытается использовать awk для фильтрации и вывода строки на основе регулярного выражения, однако есть небольшое недопонимание в использовании фигурных скобок {} в данном контексте.

Регулярное выражение `/to{1}t/` в awk должно было бы означать "строку, содержащую 't', за которым следует ровно одна 'o', и затем 't'". Однако, поскольку фигурные скобки `{}` используются для указания количества повторений предшествующего элемента, и поскольку 1 является значением по умолчанию (то есть o{1} эквивалентно просто o), данное регулярное выражение эквивалентно просто tot, что означает:

`t — буква 't'`
`o{1} — ровно одна буква 'o'`
`t — снова буква 't'`

В этом случае, входная строка "tt" не соответствует шаблону to{1}t, поскольку между 't' отсутствует 'o'. Следовательно, awk не найдет совпадения и ничего не выведет на экран.

Если ваша цель — искать строки, содержащие ровно одну 'o' между двумя 't', то данное регулярное выражение корректно, но входная строка "tt" не соответствует этому условию. Для строки "tot" команда работала бы ожидаемо и вывела бы "tot".

#### next example
`echo "tooot" | awk '/t[o{1,3}t/{print $0}'`
`echo "toot" | awk '/to{1,3}t/{print $0}'`
`echo "tot" | awk '/to{1,3}t/{print $0}'`

`echo "tooot" | awk '/t[oa]{1,3}t/{print $0}'`

- Ищет строки, в которых между двумя буквами `t находится одна или две или три буквы o`. 
- `{1,3}` применяются к непосредственно предшествующему символу или группе.


## The pipe character

The pipe character `(|)`tells the regex engine to match any of the passed strings. So, if one of
them exists, that is enough for the pattern to match. It's like a logical _or_ between the passed
strings:

`echo "welcome to shell scripting" | awk '/Linux|bash|shell/{print $0}'`
`echo "welcome to shell scripting" | sed -r -n '/Linux|bash|shell/p'`
>__!  There are no spaces between the pipes and the words.__

## Expression grouping
You can use parentheses `()`to group characters or words to make them one piece in the
eyes of the regex engine:
`echo "welcome to shell scripting" | awk '/(shell scripting)/{print $0}'`
`echo "welcome to shell scripting" | sed -r -n '/(shell scripting)/p'`

You may have realized that you can achieve that without parentheses like this:
`echo "welcome to shell scripting" | sed -r -n '/shell scripting/p'`

__!So, if the entire sentence doesn't exist, the pattern will fail.__

## Using grep
The __grep__ is a very powerful tool that most system administrators use every day. We just
want to enlighten the point of using BRE and ERE patterns as we did with sed and AWK

`grep` tool understands BRE patterns by default, and if you want to use ERE patterns, you
should use the `-E` option.

` grep -E 'to+' myfile`
