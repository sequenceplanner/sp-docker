#!/bin/bash

rm -rf /tmp/.X*lock
rm -rf /tmp/.X11-unix

arch_name="$(uname -m)"
if [ "${arch_name}" = "aarch64" ]; then
    LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 tigervncserver -SecurityTypes None  
else
    tigervncserver -SecurityTypes None
fi

sed -i 's/$(hostname)/localhost/g' /usr/share/novnc/utils/launch.sh
/usr/share/novnc/utils/launch.sh --vnc localhost:5901
