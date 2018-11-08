#!/bin/sh

printf "Enter N: "
read N
while ! [ -n "$N" -o "$N" -eq "$N" ] 2>/dev/null
do
  printf "N should be an integer. Try again: "
  read N;
done

for i in $(seq $N -1 1)
do
  spaces=$((N - i))
  for j in $(seq $spaces -1 1)
  do
    printf " "
  done
  if [ $i -eq $N -o $i -eq 1 ]
  then
  for j in $(seq $i -1 1)
  do
    printf "* "
  done
  else
    printf "* "
    for j in $(seq $((i-2)) -1 1)
    do
      printf "  "
    done
    printf "* "
  fi
  printf "\n"
done

for i in $(seq 2 $N)
do
  spaces=$((N - i))
  for j in $(seq $spaces -1 1)
  do
    printf " "
  done
  if [ $i -eq $N ]
  then
  for j in $(seq $i -1 1)
  do
    printf "* "
  done
  else
    printf "* "
    for j in $(seq $((i-2)) -1 1)
    do
      printf "  "
    done
    printf '*'
  fi
  printf "\n"
done
