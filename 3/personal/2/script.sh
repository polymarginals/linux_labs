#!/bin/bash

echo "Please, enter N: "
read N
while ! [ -n "$N" -o "$N" -eq "$N" ] 2>/dev/null
do
  echo "Wrong input, N should be an integer. Try again: "
  read N;
done

for (( i=1; $i <= $N; i++ ))
do
  spaces=$((N - i))
  for (( ; $spaces > 0; spaces-- ))
  do
    echo -ne ' '
  done
  for (( j=$i; $j > 0; j-- ))
  do
    echo -ne '* '
  done
  echo ''
done
