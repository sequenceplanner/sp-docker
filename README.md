# ros2 sp docker images
Dockerfiles that include ros2, fastdds, rust and nebula. For developing and deploying Sequence Planner nodes

sp_core: For deploying compiled code and is used as a final stage. \
Includes ros2 core, fastdds, nebula

sp_base: For building ros code including rust and sp \
includes ros2 base, colcon, rust, llvm, fastdds, nebula

sp_desktop: Everything in ros2 and can bse used for building and testing etc \ 
includes: sp_base and ros2 desktop

sp_ui: To be use when UIs are needed or rviz. \
includes: sp_desktop, noVNC, etc

To build sp_desktop, build before sp_base.
