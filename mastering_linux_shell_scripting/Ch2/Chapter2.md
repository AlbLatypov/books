# Chapter 2. Creating Interactive Scripts

## Topics:

- Using FDIP with options
- Basic script using SFBE
- Script comments
- Enhancing read scripts with SFBE prompts
- Limiting the number of entered characters
- Controlling the visibility of the entered text
- Passing options
- Read options values
- Try to be standard
- Enhancing learning with simple scripts

### Комментарии в скрипте:
ch2_hello3.sh

### Enhancing scripts with read prompts
`read -p "Enter your name: " name`

>The __read__ command with syntax using the -p option is shown as follows:
`read -p <promt> <variable name>`

### Limiting the number of entered characters
`read -p "May I ask your name: " name`
`read -n1 -p "Press any key to exit"`
- -p - promt (current line)
- -n1 - symbols number
- -sn1 -  key to continue, it will not be displayed on the screen

### Passing options
>Options are characters with a single dash before them.
`$ ./script1.sh -a -b -c`
`-a -b -c is an options`

see example: _ch2_pass_options.sh

>The __shift__ command shifts the options one step to the left.

### Passing parameters with options
To pass parameters along with options simultaneously, you must separate them with a
double dash, like this:
`$ ./script1.sh -a -b -c -- p1 p2 p3`

### Read options values

`see ch2_read_options.sh`

### Try to be standard
You may use bash scripts from GitHub, and you may notice that there is a standard option
scheme that is followed. It's not required, but it is preferable.
These are some of the commonly used options:
`-a: List all items`
`-c: Get a count of all items`
`-d: Output directory`
`-e: Expand items`
`-f: Specify a file`
`-h: Show the help page`
`-i: Ignore the character case`
`-l: List a text`
`-o: Send output to a file`
`-q: Keep silent; don't ask the user`
`-r: Process something recursively`
`-s: Use stealth mode`
`-v: Use verbose mode`
`-x: Specify an executable`
`-y: Accept without prompting me`

### Backing-up with scripts
see ch2_backup.sh and page 48

### Connecting to a server
stop here page 49
