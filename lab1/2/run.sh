#!/bin/sh

echo "  12  asdd 13 " > first.txt
echo "  12 aqw  fds v d- 121  " > second.png
echo " aqwe bfd fbt hh 2 " > third.txt.png

mkdir deep
cp first.txt second.png third.txt.png deep/

echo "#!/bin/sh" > clear.sh
echo "rm -rf deep" >> clear.sh
echo "rm -rf *.txt" >> clear.sh
echo "rm -rf *.png" >> clear.sh
echo "rm clear.sh" >> clear.sh
chmod u+x clear.sh

find . -path ./deep -prune -o -name "*.png" -print
