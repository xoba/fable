#!/bin/sh
D=${0%/*}/small-council
r(){ sed -n $(jot -r 1 1 $(wc -l<$1))p $1;}
echo "welcome, ${USER:-human}. legit fable agent at your service"
while printf 'fable> '&&read x;do for f in $D/*;do r $f;done;done
echo
