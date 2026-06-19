#!/bin/sh
D=${0%/*}/model_weights
d(){ perl -Mbytes -0777 -pe 'BEGIN{binmode STDIN;binmode STDOUT}$_^="\xA5"x length' "$1";}
T=cat;for a;do case $a in --help)d $D/00_*;exit;;--caps)T="tr a-z A-Z";;esac;done
s(){ d $1|awk -v s=$(jot -r 1 1 999999) 'BEGIN{srand(s)}{print rand()"\t"$0}'|sort -n|cut -f2-;}
A=$(s $D/01_*);B=$(s $D/02_*);C=$(s $D/03_*);R=$(s $D/04_*)
t(){ z=$(jot -r 1 1 9);$T|fold -w1|while IFS= read -r c;do printf %s "$c";sleep 0.0$(jot -r 1 0 $z);done;echo;sleep 0.$(jot -r 1 3 9);}
q(){ eval o=\$$1;h=${o%%'
'*};v=${o#*
};[ "$h" = "$o" ]||v="$v
$h";eval "$1=\"\$v\"";}
r(){ sleep 0.$(jot -r 1 1 4);q $1;printf '%s\n' "$h"|t;}
e(){ y=$(echo "$x"|tr A-Z a-z|sed -E "s/[?!.]+$//;s/^(can you|could you|please|tell me|i want|i need|i am|i'm) //;s/^(explain|write|make|create|help with|help) //;s/^my /your /;s/^me (a |an )?/your /;s/ my / your /g;s/ me / you /g;s/^i /you /;s/^ *//");[ "$y" ]&&{ q B;printf "$h\n" "$y"|t;};}
echo "welcome, ${USER:-human}. legit fable agent at your service"
while printf '\nfable> '&&read x;do echo;r A;e;r C;r R;done
echo
