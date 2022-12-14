#!/bin/bash

# Nice way to early-exit incorrectly-running programs:
ping -c 1 google.com || {
    # Example of piping to stderr
    echo 'Could not ping Google' >&2
    exit 1
}
# This is most useful in simple cases, but chaining many commands with && or ||
# is unweildy.

# Reverse the exit status of the execution
! echo "things and stuff" | grep -w "cuss" && echo "Cuss not found" # Only this prints
echo "things and stuff" | grep -w "cuss" && echo "Cuss found"
echo

# If statements can take a command to run or use [[]] to test certain
# conditions. If is entered is the command exits with success.

# The following are supported by [[]]:
# -e FILE: True if file exists.
# -f FILE: True if file is a regular file.
# -d FILE: True if file is a directory.
# -h FILE: True if file is a symbolic link.
# -p PIPE: True if pipe exists.
# -r FILE: True if file is readable by you.
# -s FILE: True if file exists and is not empty.
# -t FD : True if FD is opened on a terminal.
# -w FILE: True if the file is writable by you.
# -x FILE: True if the file is executable by you.
# -O FILE: True if the file is effectively owned by you.
# -G FILE: True if the file is effectively owned by your group.
# FILE -nt FILE: True if the first file is newer than the second.
# FILE -ot FILE: True if the first file is older than the second.
# -z STRING: True if the string is empty (its length is zero).
# String operators:
#     STRING = STRING: True if the first string is identical to the second.
#     STRING != STRING: True if the first string is not identical to the second.
#     STRING < STRING: True if the first string sorts before the second.
#     STRING > STRING: True if the first string sorts after the second.
# Numeric operators:
#     INT -eq INT: True if both integers are identical.
#     INT -ne INT: True if the integers are not identical.
#     INT -lt INT: True if the first integer is less than the second.
#     INT -gt INT: True if the first integer is greater than the second.
#     INT -le INT: True if the first integer is less than or equal to the second.
#     INT -ge INT: True if the first integer is greater than or equal to the second.
# STRING = (or ==) PATTERN: Not string comparison like with [ (or test), but pattern matching is performed. True if the string matches the glob pattern.
# STRING != PATTERN: Not string comparison like with [ (or test), but pattern matching is performed. True if the string does not match the glob pattern.
# STRING =~ REGEX: True if the string matches the regex pattern.
# ( EXPR ): Parentheses can be used to change the evaluation precedence.
# EXPR && EXPR: Much like the '-a' operator of test, but does not evaluate the second expression if the first already turns out to be false.
# EXPR || EXPR: Much like the '-o' operator of test, but does not evaluate the second expression if the first already turns out to be true.

while false
do
    echo "Entered while"
done

until true
do
    echo "Unreachable!"
done

i=10
while ((i > 0))
do
    echo "$i"
    ((i-=1))
done
echo

for i in {10..1}
do
    echo "$i"
done
echo

for (( i=10; i>0; i-- ))
do
    echo "$i"
done
echo

for i in 10 9 8 7 6 5 4 3 2 1
do
    echo "$i"
done
echo

case "english" in
    en*) echo "Hello!" ;;
    fr*) echo "Salut!" ;;
    *) echo "Unknown" ;;
esac

echo "What is an apple?"
select choice in Fruit Vegetable Tuber
do
    if [[ $choice == Fruit ]]
    then
        echo "Correct!"
    else
        echo "Incorrect!"
    fi
    break
done