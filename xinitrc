# Set xresources - (urxvrt, )
xrdb -merge ~/.Xresources
# Cursor
xsetroot -cursor_name left_ptr
# Keymap
setxkbmap -layout gb
# Increase key repeat rate
xset r rate 200 28
# Wallpaper
sh ~/.fehbg &
# Xmonad
exec xmonad
