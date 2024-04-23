#!/bin/bash
# Author: Latypov A
# Script to prompt to back up files and location
# The files will be search on from the user's home
# directory and can only be backed up to a directory
# within $HOME
# Last Edited: Apr 14 2024
read -p "Which file types do you want to backup: " file_suffix
m_dir=/home/aflw/Documents/Learning/Devops/books/mastering_linux_shell_scripting
read -p "Which directory  do you want to backup: " dir_name
#The next lines creates the directory if it does not exist
test -d $m_dir/$dir_name || mkdir -m 700 $m_dir/$dir_name
# The find command will copy files the match the search criteria ie .sh. The -path, -prune and -o options ate to exclude the backdirectory from the backup.
find $m_dir -path $m_dir/$dir_name -prune -o -name "*$file_suffix" -exec cp {} $m_dir/$dir_name/ \;
exit 0
