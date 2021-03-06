#!/bin/sh

is_n_correct=false
while ! [ "$is_n_correct" = true ]
do
  printf "Enter an odd integer: "
  read N
  check=`echo "$N" | grep ^[0-9]*[13579]$`

  if [ "$check" != '' ]; then
    is_n_correct=true
  else
    is_n_correct=false
    printf "Wrong input. "
  fi
done

for i in $(seq $N -1 1)
do
  for j in $(seq $i -1 1)
  do
    printf "* "
  done
  printf "\n"
done
