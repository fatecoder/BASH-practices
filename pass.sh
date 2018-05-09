#!/bin/bash

function help {
  echo "Usage: $0 [-i <valor inicial>] [-f <valor final>] [-a <archivo>]";
}

while getopts :i:f:a: opt; do
  case $opt in
    i)
      i=$OPTARG;;
    f)
      f=$OPTARG;;
    a)
      a=$OPTARG;;
  esac
done

if [ -z "${i}" ] || [ -z "${f}" ] || [ -z "${a}" ]; then
  help
else
  echo "i = ${i}"
  echo "f = ${f}"
  echo "a = ${a}"
  echo "####OUTPUT####"
  > temp
  for num in `eval echo "{$i..$f}"`; do
    cat -n $a | grep "$num" | sed 's/^[     0-9]*//' >> temp
  done

  sed 's/^[ \t]*//' temp
fi
