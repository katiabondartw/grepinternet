#!/bin/sh
PATHS_FILE="../data/wet.paths2"
date
COUNTER=1
while read p; do
  echo "s3://commoncrawl/$p" 
  aws s3 --no-sign-request cp "s3://commoncrawl/$p" - | gunzip -c | grep -o -f ../patterns/pattern | wc -l > "../res/$COUNTER"
  ((COUNTER=COUNTER+1))
done < $PATHS_FILE
date
echo "job finished"
