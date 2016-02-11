#!/bin/bash
printers=`lpstat -p | grep printer | cut -f2 -d ' '`
# printers=$(($printers-1))
isfirst=1
echo "{"
echo "\"data\":["
for printer in $printers
do
    if [ "$isfirst" == "1" ] ; then
	isfirst=0
    else
	echo ","
    fi
    echo "    {\"{#PRINTER}\":\"$printer\"}"
done
echo "]"
echo "}"
