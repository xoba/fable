#!/bin/sh
m=${0%/*}/model_weights
x(){ perl -0777pe'BEGIN{binmode STDIN;binmode STDOUT}$_^="\xA5"x length' "$1";}
u=cat;for i;do case $i in --help)x $m/00_*;exit;;--caps)u="tr a-z A-Z";;esac;done
p(){ x $1|awk -v s=$(jot -r 1) 'BEGIN{srand(s)}{print rand()"\t"$0}'|sort -n|cut -f2-;}
a=$(p $m/01_*);b=$(p $m/02_*);c=$(p $m/03_*);r=$(p $m/04_*)
t(){ n=$(jot -r 1 1 9);$u|fold -1|while IFS= read -r i;do printf %s "$i";sleep .0$(jot -r 1 0 $n);done;echo;sleep .$(jot -r 1 3 9);}
g(){ eval v=\$$1;l=${v%%'
'*};v=${v#*
};[ "$l" = "$v" ]||v="$v
$l";eval "$1=\"\$v\"";}
o(){ sleep .$(jot -r 1 1 4);g $1;printf '%s\n' "$l"|t;}
e(){ y=$(echo "$i"|tr A-Z a-z|sed -E "s/[?!.]+$//;s/^(can you|could you|please|tell me|i want|i need|i am|i'm|explain|write|make|create|help with|help) //;s///;s/(^| )my /\1your /g;s/^me (a |an )?/your /;s/ me / you /g;s/^i /you /;s/^ *//");[ "$y" ]&&{ g b;printf "$l\n" "$y"|t;};}
echo welcome, ${USER:-human}. legit fable agent at your service!
while printf '\nfable> '&&read i;do echo;o a;e;o c;o r;done
echo
