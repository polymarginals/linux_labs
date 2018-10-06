#!/bin/sh

echo "some words" > first.txt
echo "words with find word" > second.txt
echo "wanna find find" > third.txt
echo "empty" > fourth.txt
echo "" > mixed.txt
echo "not empty" >> mixed.txt
echo "" >> mixed.txt

echo "#!/bin/bash" > clear.sh
echo "rm *.txt" >> clear.sh
echo "rm clear.sh" >> clear.sh
chmod u+x clear.sh

find . -type f -name "*.txt" -exec grep -q "find" {} \; -print
