#!/bin/sh
PATHS_FILE="../split/wet$1"
date
COUNTER=1
MACHINE=$1
while read p; do
  echo "$COUNTER s3://commoncrawl/$p" 
  aws s3 --no-sign-request cp "s3://commoncrawl/$p" - | gunzip -c | grep -o -f ../patterns/pattern | wc -l > "../res/$COUNTER"
  aws s3 cp "../res/$COUNTER" "s3://grepinternet/$MACHINE/$COUNTER"
  ((COUNTER=COUNTER+1))
done < $PATHS_FILE
date
echo "job finished"
