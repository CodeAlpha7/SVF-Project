USAGE_STR="USAGE: ./test.sh [path/to/test.bc]"

if [ $# -eq 0 ]
  then
    echo $USAGE_STR
  else
    ./bin/svf-project $1 > out.txt
fi