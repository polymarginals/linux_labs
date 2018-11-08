#!/bin/sh

printf "Enter N: "
read N
while ! [ -n "$N" -o "$N" -eq "$N" ] 2>/dev/null
do
  printf "N should be an integer. Try again: "
  read N;
done

for i in $(seq 1 $N)
do
  for j in $(seq $i -1 1)
  do
    printf "* "
  done
  printf "\n"
done
