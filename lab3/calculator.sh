#!/bin/sh

if [ $# -lt 3 -o $(($# % 2)) -eq 0 ]
then
  # количество аргументов меньше 3 или оно чётное
  echo "Неверное количество аргументов."
  exit 1;
else
  res=$1 # инициализируем хранилище результата
  shift 1

  while [ $# -ne 0 ]
  do
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
