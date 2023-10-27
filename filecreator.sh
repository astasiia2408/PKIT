#!/bin/bash

function create(){
filename=$1

touch $filename
}

username=$(whoami)

n=1

if ls | grep -q "$username"; then

     n=$(ls | grep  "$username" | sort -n | tail -1 | cut -d "-" -f2)
fi

for  k in {1..24}; do


  n=$((n+1))

create "$username-$n"
done
echo "Створено 25 пустих файлів"
create "$username-$n"
