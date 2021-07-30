# Web-based desktop to use with UR sim for CB3
A dockerfile with novnc web-interface and URSIM

inside the folder:

```console
docker build -t ur-web_cb3 .
docker run --rm -it -p 5901:5901 -p 6080:6080 -p 29999:29999 -p 30001-30004:30001-30004 --privileged ur-web_cb3
```

And then http://localhost:6080/vnc_lite.html in a browser

You can also connect using vsc and remote connection to the container: https://code.visualstudio.com/docs/remote/containers

Inspired by https://github.com/aip-primeca-occitanie/ros-introduction-robmob (for ROS1)
