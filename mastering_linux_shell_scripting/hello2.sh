#!/bin/bash
echo "U are using $0"
echo "You are using $(basename $0)"
echo "Hello $1"
echo "Hello $*"
exit 0

#!/bin/bash: Normally, this is always the first line of the script and is known as
# the shebang. The shebang starts with a comment, but the system still uses this
# line. A comment in a shell script has the # symbol. The shebang instructs the
# interpreter of the system to execute the script. We use bash for shell scripts, and
# we may use PHP or Perl for other scripts, as required. If we do not add this line,
# then the commands will be run within the current shell; it may cause issues if we
# run another shell.

#echo "Hello World": The FDIP command will be picked up in a built-in shell
# and can be used to write a standard output, 45%065; this defaults to the screen.
# The information to print is enclosed in double quotes; there will be more on
# quotes later.

# exit 0: The FYJU command is a built-in shell, and is used to leave or exit the
# script. The FYJU code is supplied as an integer argument. A value of anything
# other than 0 will indicate some type of error in the script's execution.
