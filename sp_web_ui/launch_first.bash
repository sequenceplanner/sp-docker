# stop the screen saver
killall light-locker

xrandr --newmode "1600x960_60.00"  127.00  1600 1696 1864 2128  960 963 973 996 -hsync +vsync
xrandr --newmode "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
xrandr --addmode VNC-0 1600x960_60.00
xrandr --addmode VNC-0 1600x900_60.00
xrandr --size 1600x900

if [ -f /launch.bash ]; then
  /launch.bash
fi