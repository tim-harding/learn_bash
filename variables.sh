#! /bin/bash

a=5
a+=2
echo "$a" # 52

a=5
let a+=2
echo "$a" # 7

declare -a array
declare -A dict

for item in "$*"
do
    echo "$item" # "a b c"
done

for item in "$@"
do
    echo "$item" # "a" "b" "c"
done

echo "$#" # 3
echo "$$" # PID of shell
echo "$?" # Exit code of last command, 0

echo "${thing:-word}" # Substitute when unset
thing="thing"
echo "${thing:+word}" # Substitute when set
echo "${#thing}" # Length

thing="things and stuff and things and stuff"
# Shortest matches deleted from beginning or end
echo "${thing#*and }" # stuff and things and stuff
echo "${thing%and*}" # things and stuff and things
# Longest matches (greedy)
echo "${thing##*and }" # stuff
echo "${thing%%and*}" # things
# Replacement, first or all
echo "${thing/and/but}"
echo "${thing//and/but}"
array=("things", "and", "stuff")
# Useful for common prefixes and suffixes
echo "${array[@]/#/prefix }" # Match against start
echo "${array[@]/%/ suffix}" # Match against end, not fully understanding this one

# # refers to beginning
# % refers to end
# Doubling causes greediness

ping google.com &
echo "$!" # PID of last background command
sleep 1
kill $!