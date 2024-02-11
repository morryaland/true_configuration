current_hour=$(date +"%H")
if [ $current_hour -ge 9 -a $current_hour -lt 20 ]; then     
	xrdb ~/.wallpaper/.Xresources_day
	feh --bg-scale $HOME/.wallpaper/day.jpg &
	polybar -c $HOME/.wallpaper/config_day.ini &
else
	xrdb ~/.wallpaper/.Xresources_night
	feh --bg-scale $HOME/.wallpaper/night.jpg &
	polybar -c $HOME/.wallpaper/config_night.ini &
fi
unclutter &
picom &
