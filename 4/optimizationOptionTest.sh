#!/bin/sh

echo "Best optimization option: -O2 -march=native"

for i in "-fipa-pta -flto" "-fprofile-generate" "-fprofile-use" "-fipa-pta -flto -fprofile-generate" "-fipa-pta -flto -fprofile-use"
do
  echo ""
  echo "Optimization options: $i"
  g++ -O2 $i -march=native $1 -o OptimizationOption
  time -p ./OptimizationOption
done

echo "Done"
