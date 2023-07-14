#!/bin/bash

while read urls; #While there are URLs (stored on new lines)
do
  STATUS=$(curl --head -s -o /dev/null  -w "%{http_code}" $urls) #Store HTTP code in variable
  ERROR=$(curl --head -s -o /dev/null -w "%{exitcode}" $urls) #Store exit code in variable

if [ "$ERROR" == "35" ] || [ "$ERROR" == "60" ] || [ "$ERROR" == "66" ] ||
    [ "$ERROR" == "77" ] || [ "$ERROR" == "90" ] || [ "$ERROR" == "91" ]; then #Check error code against SSL exit code errors
  printf '%s\n' "$urls,SSL INVALID" >> brokenURLs.txt  #Print $url and string if URL has one of the above exit code errors to brokenURLs.txt file

elif [ $STATUS -ge 400 ]; then #Check if HTTP status is 400 or higher as those are "bad" HTTP status codes
  printf '%s\n' "$urls,$STATUS" >> brokenURLs.txt #Print $url and $STATUS variable if HTTP status code is 400 or higher

elif [ $STATUS -eq 000 ]; then #Check if HTTP status code is 000
  printf '%s\n' "$urls,TIMED OUT" >> brokenURLs.txt #Print URL and string if HTTP status code is 000

  fi
done < urls.txt #file containing the URLs to be read through by script
