#!/bin/sh

echo "1 2 3 4" > test
echo "2 3 13 5" > test_more
echo "word buzzword more words" > test_words

echo "#!/bin/sh" > clear.sh
echo "rm test test_more test_words" >> clear.sh
echo "rm clear.sh" >> clear.sh
chmod u+x clear.sh

find . -type f -name "*_*" -ok rm {} \;
