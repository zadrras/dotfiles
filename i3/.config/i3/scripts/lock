#!/usr/bin/env sh

tmpbg=`mktemp /tmp/lockscreen.XXXXXXXX.png` || exit 1
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
i3lock -u -i "$tmpbg"
rm "$tmpbg"
