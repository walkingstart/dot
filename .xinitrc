if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/*; do
   [ -x "$f" ] && . "$f"
 done
  unset f
  fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export MPD_HOST=$HOME/.config/mpd/socket
xset s 0 &
xset b 0 &
xset -dpms  &
setterm -blank 0 &
xblacklight -set 10 &
export LC_CTYPE="zh_CN.UTF-8"
urxvtd -q -o -f
# volumeicon &
# fcitx &
#exec awesome
 exec i3


