#!/usr/bin/bash
argument="${1}"

if [ ${argument} = 'ok' ]; then
  echo 'Great!!' >> ok.txt
elif [ ${argument} = 'ng' ]; then
  ls test.txt 2> ng.txt
else
  echo 'Wrong command line argument. Please try again'
fi 

