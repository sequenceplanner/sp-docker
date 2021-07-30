FROM ubuntu:bionic

# Setup Environment
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /ursim

RUN apt-get update -qqy \
 && apt-get install -qqy \
   curl \
    nano \
    mesa-utils \
    net-tools \
    novnc \
    onboard \
    tigervnc-standalone-server \
    tigervnc-xorg-extension \
    terminator \
    x11-apps \
    xfce4 \
    wget \
 && rm -rf /var/lib/apt/lists/* 

# Set robot model - Can be UR3, UR5, UR10 or UR16
ENV ROBOT_MODEL UR10
RUN \
    echo "**** Installing Dependencies ****" && \
    apt-get update && \
    apt-get install -qy --no-install-recommends \
    openjdk-8-jre psmisc && \
    # Change java alternatives so we use openjdk8 (required by URSim)
    update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java 10000 && \
    rm -rf /var/lib/apt/lists/* 

# Setup JAVA_HOME 
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN \
    echo "**** Downloading URSim ****" && \
    # Make sure we are in the root
    cd / && \ 
    # Download URSim Linux tar.gz
    curl https://s3-eu-west-1.amazonaws.com/ur-support-site/116229/URSim_Linux-3.15.3.106223.tar.gz -o URSim-Linux.tar.gz && \
    # Extract tarball
    tar xvzf URSim-Linux.tar.gz && \
    #Remove the tarball
    rm URSim-Linux.tar.gz && \
    # Rename the URSim folder to just ursim 
    mv  /ursim* /ursim

RUN \
    # cd to ursim folder
    cd /ursim && \
    # Make URControl and all sh files executable
    chmod +x ./*.sh ./URControl && \
    #
    # Stop install of unnecessary packages and install required ones quietly
    sed -i 's|apt-get -y install|apt-get -qy install |g' ./install.sh && \
    # Skip xterm command. We dont have a desktop
    #sed -i 's|tty -s|(exit 0)|g' install.sh && \
    # Skip Check of Java Version as we have the correct installed and the command will fail
    sed -i 's|needToInstallJava$|(exit 0)|g' install.sh && \
    # Skip install of desktop shortcuts - we dont have a desktop
    sed -i '/for TYPE in UR3 UR5 UR10/,$ d' ./install.sh  && \
    # Remove commands that are not relevant on docker as we are root user
    sed -i 's|pkexec ||g' ./install.sh && \ 
    sed -i 's|sudo ||g' ./install.sh && \
    #
    apt-get update -qqy && \
    apt-get -y install lib32gcc1 lib32stdc++6 libc6-i386 \
    libcurl3 libjava3d-* ttf-dejavu* fonts-ipafont fonts-baekmuk \
    fonts-nanum fonts-arphic-uming fonts-arphic-ukai && \
    # Install URSim
    ./install.sh && \
    #
    echo "Installed URSim" && \
    # fix the start script
    sed -i 's|rm -f|rm -fr|g' ./start-ursim.sh && \
    rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY entrypoint.sh launch.bash launch.desktop /
RUN chmod +x entrypoint.sh launch.bash launch.desktop && \
   mkdir -p ~/.config/autostart/ && \
   mv /launch.desktop ~/.config/autostart/ && \
   mkdir ~/.vnc && \
   echo "#!/bin/sh\nstartxfce4" > ~/.vnc/xstartup && \
   chmod +x ~/.vnc/xstartup 
ENV XFCE_PANEL_MIGRATE_DEFAULT true




CMD /entrypoint.sh

# Interface Ports
EXPOSE 29999
EXPOSE 30001-30004
EXPOSE 5901
EXPOSE 6080