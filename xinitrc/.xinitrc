[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &
xrandr --dpi 160
exec i3
