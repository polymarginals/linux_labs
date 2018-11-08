#!/bin/sh

for i in "-O0" "-Os" "-O1" "-O2" "-O3" "-O2 -march=native" "-O3 -march=native" "-O2 -march=native -funroll-loops" "-O3 -march=native -funroll-loops"
do
  echo ""
  echo "Using $i optimization level..."
  
  # compiling source code with g++
  g++ $i $1 -o OptimizationLvl -lm
  # counting time
  time -p ./OptimizationLvl
  echo "Executable file storage usage:"
  du -h ./OptimizationLvl
  
  printf '\n\n'
done

echo "Done."
