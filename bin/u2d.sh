#!/bin/bash
for i in $1 
do
    git mv $i `echo $i | sed s/_/-/g`;
done
