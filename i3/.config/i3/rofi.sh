#!/usr/bin/env bash

# --- APPLY XRES BEGIN
c_red_l="CC6666"
c_green_l="BDE077"
c_cyan_d="72AD8C"
c_cursor="fff000"
c_yellow_d="FEA63C"
c_green_d="B7CE42"
c_yellow_l="FFE863"
c_foreground="ddeedd"
c_blue_l="AACCBB"
c_magenta_l="ff5879"
c_black_d="25374A"
c_background="131D24"
c_magenta_d="F26B9E"
c_black_l="3A526B"
c_blue_d="66AABB"
c_white_l="FFFFFF"
c_cyan_l="9FE3BC"
c_red_d="BD4A4A"
c_white_d="DDEEDD"
# --- APPLY XRES END

dir=`dirname $0`
tod=$(dir)timeofday.sh

bg="$c_background"  # Default background for undefined times of day
fg="$c_foreground"
case $tod in
  "Late Night")
    bg="$c_black_d"
    fg="$c_black_l"
    ;;
  "Early Morning")
    bg="$c_blue_d"
    fg="$c_black_d"
    ;;
  "Morning")
    bg="$c_cyan_d"
    fg="$c_white_l"
    ;;
  "Afternoon")
    bg="$c_white_l"
    fg="$c_black_l"
    ;;
  "Late Afternoon")
    bg="$c_yellow_d"
    fg="$c_black_d"
    ;;
  "Evening")
    bg="$c_background"
    fg="$c_yellow_d"
    ;;
  "Night")
    bg="$c_black_d"
    fg="$c_blue_l"
    ;;
esac

rofi -show run -fullscreen -fg "#$fg" -bg "#$bg" -hlbg "#$fg" -hlfg "#$bg" -bc "#$c_background" -location 0 -lines 8 -bw 0 -font "Inconsolata Bold 16" -padding 400 -separator-style none -opacity 85
