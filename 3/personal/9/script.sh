#!/bin/bash

echo "Please, enter N: "
read N
while ! [ -n "$N" -o "$N" -eq "$N" ] 2>/dev/null
do
  echo "Wrong input, N should be an integer. Try again: "
  read N;
done

for (( i=$N; $i >= 1; i-- ))
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

for (( i=2; $i <= $N; i++ ))
do
  spaces=$((N - i))
  for (( ; $spaces > 0; spaces-- ))
  do
    echo -ne ' '
  done
  if [ $i -eq $N ]
  then
    for (( j=$i; $j > 0; j-- ))
    do
      echo -ne '* '
    done
  else
    echo -ne '* '
    for (( j=$i-2; $j > 0; j-- ))
    do
      echo -ne '  '
    done
    echo -ne '*'
  fi
  echo ''
done
