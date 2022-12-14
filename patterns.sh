#!/bin/bash

# Globs: They are anchored at both ends and must match the whole string. Globs
# should be used in place of `ls` for scrips. When used for filenames, * and ?
# will not match directory separators. A ** should be used instead.
# - * matches any string
# - ? matches any character
# - [...] matches any given character

echo *
echo

for file in ../**/*; do
    if [[ $file = *.sh ]]; then
        echo $file
    fi
done
echo

# This command enables additional glob features:
shopt -s extglob
# It enables the following features:
# - ?(list): Matches zero or one occurrence of the given patterns.
# - *(list): Matches zero or more occurrences of the given patterns.
# - +(list): Matches one or more occurrences of the given patterns.
# - @(list): Matches one of the given patterns.
# - !(list): Matches anything but the given patterns.
# For example:

echo ../**/!(*.sh|*.json)

# Regex can also be used, but only within the [[]] context. This dialect does
# seem a bit unfamiliar, however, as the below does not work. The reference
# source is this:
# https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_04
if [[ 'english' =~ '\w+li\w+' ]]; then
    echo "Matches!"
fi