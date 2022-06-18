#!/bin/sh -e
mkdir -p $1-${2}x/xfwm4
cd $1/xfwm4
for i in *.xpm
do
    convert $i -scale $2'00%' ../../$1-${2}x/xfwm4/$i
done
cp themerc ../../$1-${2}x/xfwm4
