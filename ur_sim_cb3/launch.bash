!#/bin/bash

# stop the screen saver
killall light-locker

# launch the ros stuff
/ursim/install.sh
/ursim/start-ursim.sh ${ROBOT_MODEL}

