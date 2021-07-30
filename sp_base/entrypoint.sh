#!/bin/bash
set -e

if [[ -n "${ROS_DISCOVERY_SERVER}" ]]; then
  export FASTRTPS_DEFAULT_PROFILES_FILE="/super_client.xml"
  sed -i "s|<address>192.168.1.2|<address>${ROS_DISCOVERY_SERVER}|g" /super_client.xml
fi

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
exec "$@"