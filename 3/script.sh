#!/bin/bash

if [ $# -lt 3 -o $(($# % 2)) -eq 0 ]
then
  # количество аргументов меньше 3 или оно чётное
  echo "Неверное количество аргументов."
  exit 1;
else
  res=0 # инициализируем хранилище результата

  # регулярное выражение для проверки на валидное вещественное число
  valid_num_regex='[+-]?[0-9]+(\.?[0-9]+)*'

  if ! [[ $1 =~ $valid_num_regex ]]
  then
    echo "Неверный аргумент: $1. Требуется число."
    exit 2;
  else
    res=$1
    shift 1
  fi

  while [ $# -ne 0 ]
  do
    if ! [[ $2 =~ $valid_num_regex ]]
    then
      echo "Неверный аргумент: $2. Требуется число."
      exit 2;
    fi

    # операнды проверены, проверяем операцию
    case $1 in
      +) res=`echo "scale=6;$res + $2" | bc` ;;
      -) res=`echo "scale=6;$res - $2" | bc` ;;
      x|X) res=`echo "scale=6;$res * $2" | bc` ;;
      /)
        if ! [ $(echo "scale=6;$2 == 0.0" | bc) -eq 1 ]
          then
          res=`echo "scale=6;$res / $2" | bc`
        else
          echo "Деление на ноль запрещено."
          exit 3;
        fi
        ;;
      *) # неподдерживаемая операция
        echo "Операция $1 не поддерживается."
        echo "Поддерживаемые операции: + (сложение), - (вычитание), х или Х  (умножение) и / (деление)."
        exit 4;
        ;;
    esac

    shift 2
  done
  echo $res
fi
