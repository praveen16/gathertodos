#! /bin/bash
# Greps the codebase looking for TODO entries, and prints out who's the lazy dev that left it there...

git grep -n "TODO" | 
while read -d $'\n' task
do 
    split=(${task//:/ })
     file=${split[0]}
     line=${split[1]}
      git blame -L $line,$line $file
done
