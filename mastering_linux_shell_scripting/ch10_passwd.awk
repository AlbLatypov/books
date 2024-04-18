function green(s) {
    printf "\033[1;32m" s "\033[0m\n"
}
BEGIN {
    FS=":"
    green("Name:                UID:    Shell:")
}
{
    printf "%-20s %-7d %-30s\n", $1,$3,$7
}
