#!/bin/bash

echo Introduce un texto
read t

for letra in ${t[@]}; do
  echo $letra
done
