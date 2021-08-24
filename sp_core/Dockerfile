FROM ros:rolling-ros-core-focal

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp ROS_DOMAIN_ID=0
RUN echo "net.core.rmem_max=8388608\nnet.core.rmem_default=8388608\n" | tee /etc/sysctl.d/60-cyclonedds.conf

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]