# Chapter 1. What and Why of Scripting with Bash

### Installing:

- __bashdb__ - required package for the bash debug plugin
  -  apt-get install bashdb
- plugin for VS Code, called bash debug

>__Basic idea__ 
>The basic idea of bash scripting is to execute multiple commands to automate a specific job

### Go ahead
>__type command__
The _type_ command will display the type of command for a given word entered at the command line.The types of command are listed as follows:
>  - alias
>  - Function
>  - Shell built-in
>  - Keyword
>  - File
>
>__$ type -a ls__
ls is aliased to 'ls --color=auto'
ls is /bin/ls
>
>__$ type -t ls__
alias
>
>__$type ls quote pwd do id__
try it


### Preparing text editors for scripting
> set some usefule options in vim editor file __$HOME/.vimrc__
page 12

### Checking exit status
>__command1 || command2__
command2 executed only if command1 exit code != 0
> __command1 && command2__
command2 executed only if command1 exit code = 0
> __echo $?__
checking exit code

### Running the script with arguments
>page 18. table
### The importance of correct quotes
>page 19, run _hello2.sh_

### Declaring variables
>There are two kinds of variables you can declare in your script:
>- User-defined variables
>- Environment variables
>_example_vars.sh_
Note that there are __no spaces__ between the variable name and the equals sign, or between
the equals sign and the value.
If you forget and type a space in between, the shell will treat the variable as if it were a
command, and, since there is no such command, it will show an error.
### Environment variables
>There are many environment variables. If you want to list them, you can use the:
> - __printenv__ 

>Note that all environment variables are written in capital letters, so you can declare your
variables as lower case to make it easy to differentiate your variables from environment
variables. This is not required, but is preferable.
### Variable scope
>Once you have declared your variable, it will be available for use in your entire bash script without any problems.
...variable's scope is only limited to the process that
creates it...
try __export__ to use vars in another scripts.

>...Another script only makes a copy of the variable and
never touches the original one...

__Details in page 25__

### Command substitution
>So far, we have seen how to declare variables. These variables can hold integers, strings,
arrays, or floats, as we have seen, but this is not everything.

>A command substitution means storing the output of a command execution in a variable.
> - __cur_dir=$(pwd)__
> - __echo $cur_dir__

### Debugging your scripts
>If we want to look at the verbose output from our script and the detailed information about
the way the script is evaluated line by line, we can use the __-v__ option. This can be within the
shebang, but it is often easier to run the script directly with bash:

>The __-x__ option, which displays the commands as they are executed, is more commonly used.
It's useful to know the decision branch that has been chosen by the script. The following
shows this in action:
>- __bash -x | -v__ scriptname.sh

>Another modern way of debugging shell scripts is by using __Visual Studio Code__.
There is a plugin called bash debug that enables you to debug bash scripts visually, as is
the case for any other programming language.
__See page 28__
