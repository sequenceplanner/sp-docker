# Web-based desktop to use in SP
A dockerfile with novnc web-interface and ROS2 rolling


```console
docker run --rm -it -p 5901:5901 -p 6080:6080 kristoferb/spweb_ros2:latest
```

And then http://localhost:6080/vnc.html in a browser

To run multiple containers, launch with
```console
docker run --rm -it -p 5902:5902 -p 6081:6080 -e VNC_PORT=5902 kristoferb/spweb_ros2:latest
```

and then http://localhost:6081, in the browser


If you are using this image in another image, you can add a launch.bash to the root with commands that will start inside the desktop.

Inspired by https://github.com/aip-primeca-occitanie/ros-introduction-robmob (for ROS1)
