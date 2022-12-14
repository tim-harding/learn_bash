# Globs: They are anchored at both ends and must match the whole string. Globs
# should be used in place of `ls` for scrips. When used for filenames, * and ?
# will not match directory separators. A ** should be used instead.
# - * matches any string
# - ? matches any character
# - [...] matches any given character

echo *

for file in ../**/*
do
    echo $file
done