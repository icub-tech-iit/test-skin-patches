FROM ubuntu:latest
LABEL org.opencontainers.image.title="Test Skin Patches"
LABEL org.opencontainers.image.description="Infrastructure for testing skin spatches"
LABEL org.opencontainers.image.source="https://github.com/icub-tech-iit/test-skin-patches"
LABEL org.opencontainers.image.authors="Ugo Pattacini <ugo.pattacini@iit.it>"

# Non-interactive installation mode
ENV DEBIAN_FRONTEND=noninteractive

# Update apt database
RUN apt update

# Install essentials
RUN apt install -y apt-utils software-properties-common apt-transport-https sudo \
    psmisc lsb-release tmux nano wget curl gedit build-essential gdb git gitk \
    cmake cmake-curses-gui libedit-dev libxml2-dev autoconf locales gdebi terminator meld \
    dos2unix net-tools iproute2 can-utils dbus-x11

# Set the locale
RUN locale-gen en_US.UTF-8

# Install graphics
RUN apt install -y xfce4 xfce4-goodies xserver-xorg-video-dummy xserver-xorg-legacy x11vnc && \
    apt remove -y xfce4-power-manager xfce4-screensaver light-locker && \
    apt autoremove -y && \
    sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config
COPY xorg.conf /etc/X11/xorg.conf
RUN dos2unix /etc/X11/xorg.conf

# Install browser
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    gdebi -n google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

# Install python
RUN apt install -y python3 python3-dev python3-pip python3-setuptools && \
    if [ ! -f "/usr/bin/python" ]; then ln -s /usr/bin/python3 /usr/bin/python; fi
    
# Install magic-wormwhole to get things from one computer to another safely
RUN apt install -y magic-wormhole

# Install noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    git clone https://github.com/novnc/websockify /opt/novnc/utils/websockify && \
    echo "<html><head><meta http-equiv=\"Refresh\" content=\"0; url=vnc.html?autoconnect=true&reconnect=true&reconnect_delay=1000&resize=scale&quality=9\"></head></html>" > /opt/novnc/index.html

    
# Select options
ARG ROBOTOLOGY_SUPERBUILD_RELEASE
ARG BUILD_TYPE

# Set up git (required by superbuild)
RUN git config --global user.name "GitHub Actions" && \
    git config --global user.email "actions@github.com"

# Build robotology-superbuild and # install apt dependencies
RUN git clone https://github.com/robotology/robotology-superbuild.git --depth 1 --branch ${ROBOTOLOGY_SUPERBUILD_RELEASE} && \
    ./robotology-superbuild/scripts/install_apt_dependencies.sh

RUN cd robotology-superbuild && \
    mkdir build && cd build && \
    cmake .. \
          -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
          -DYCM_EP_INSTALL_DIR=/usr/local \
          -DROBOTOLOGY_USES_GAZEBO:BOOL=OFF \
          -DROBOTOLOGY_ENABLE_ICUB_HEAD:BOOL=ON && \
    make && \
    cd ../.. && rm -Rf robotology-superbuild

# Clone the repo
RUN git clone https://github.com/icub-tech-iit/test-skin-patches.git --depth 1 && \
    mv test-skin-patches/config-files . && \
    rm -Rf test-skin-patches

# Clean up git configuration
RUN git config --global --unset-all user.name && \
    git config --global --unset-all user.email

# Set environmental variables
ENV DISPLAY=:1
ENV YARP_COLORED_OUTPUT=1

# Set up .bashrc
RUN echo "source /usr/local/share/robotology-superbuild/setup.sh" >> ~/.bashrc && \
    echo "LD_LIBRARY_PATH=/usr/local/lib:\${LD_LIBRARY_PATH}" >>  ~/.bashrc

# Set up script to launch graphics and vnc
COPY start-vnc-session.sh /usr/bin/start-vnc-session.sh
RUN chmod +x /usr/bin/start-vnc-session.sh && \
    dos2unix /usr/bin/start-vnc-session.sh

# Manage ports
EXPOSE 5901 6080 10000/tcp 10000/udp

# Clean up unnecessary installation products
RUN rm -Rf /var/lib/apt/lists/*

# Launch bash from /config-files
WORKDIR /config-files
CMD ["bash"]
