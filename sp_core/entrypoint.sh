#!/bin/bash
set -e

# Set cyclone network interface
if [[ -n "${ROS_INTERFACE}" ]]; then
  export CYCLONEDDS_URI="<CycloneDDS><Domain><General><NetworkInterfaceAddress>${ROS_INTERFACE}</></></></>"
fi

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
exec "$@"