# ros2 sp base that includes colcon and rust
A dockerfile base for sequence planner development. 

inside the folder:

```console
docker build -t spbase .
docker run --rm -it spbase
```

To set cyclonedds interface
```console
docker run --rm -it -e -e ROS_INTERFACE="eth0" spbase
```

