!#/bin/bash

# stop the screen saver
killall light-locker

xrandr --newmode "1600x960_60.00"  127.00  1600 1696 1864 2128  960 963 973 996 -hsync +vsync
xrandr --addmode VNC-0 1600x960_60.00
xrandr --size 1280x960

# launch the ros stuff
/ursim/install.sh
/ursim/start-ursim.sh ${ROBOT_MODEL}

