#!/bin/sh
D=${0%/*}/model_weights
t(){ fold -w1|while IFS= read -r c;do printf %s "$c";sleep 0.0$(jot -r 1 0 5);done;echo;}
l(){ sed -n $(jot -r 1 1 $(wc -l<$1))p $1;}
r(){ sleep 0.$(jot -r 1 1 4);l $1|t;}
e(){ y=$(echo "$x"|tr A-Z a-z|sed -E "s/[?!.]+$//;s/^(can you|could you|please|tell me|i want|i need|i am|i'm) //;s/^(explain|write|make|create|help with|help) //;s/^my /your /;s/^me (a |an )?/your /;s/ my / your /g;s/ me / you /g;s/^i /you /;s/^ *//");[ "$y" ]&&printf "$(l $D/02_*)\n" "$y"|t;}
echo "welcome, ${USER:-human}. legit fable agent at your service"
while printf 'fable> '&&read x;do r $D/01_*;e;r $D/03_*;r $D/04_*;done
echo
