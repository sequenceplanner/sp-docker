#!/bin/bash

rm -rf /tmp/.X*lock
rm -rf /tmp/.X11-unix

port=${VNC_PORT:-5901}

arch_name="$(uname -m)"
if [ "${arch_name}" = "aarch64" ]; then
    LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 tigervncserver -rfbport ${port} -SecurityTypes None
else
    tigervncserver -rfbport ${port} -SecurityTypes None
fi


sed -i 's/$(hostname)/localhost/g' /usr/share/novnc/utils/launch.sh
/usr/share/novnc/utils/launch.sh --vnc localhost:${port}
