current_hour=$(date +"%H")
polybar -c $HOME/.wallpaper/config.ini &
if [ $current_hour -ge 9 -a $current_hour -lt 20 ]; then     
	xrdb ~/.wallpaper/.Xresources_day
	feh --bg-scale $HOME/.wallpaper/day.jpg &
else
	xrdb ~/.wallpaper/.Xresources_night
	feh --bg-scale $HOME/.wallpaper/night.jpg &
fi
unclutter &
picom &
