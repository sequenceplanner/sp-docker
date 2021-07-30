# ros2 sp base that includes colcon and rust, as well as fastdds
A dockerfile base for sequence planner development. 

inside the folder:

```console
docker build -t spbase .
docker run --rm -it spbase
```

To use a discovery server, start with :
```console
docker run --rm -it -e -e ROS_DISCOVERY_SERVER="server-ip-adress" spbase
```

