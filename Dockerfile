FROM mjenz/ros-indigo-desktop-full

# Install all these dependencies git-core python-argparse python-wstool python-vcstools python-rosdep ros-indigo-control-msgs ros-indigo-joystick-drivers
# RUN apt-get update && \
# set shell to bash
SHELL ["/bin/bash", "-c"] 

RUN apt-get install -y \
    git-core \
    python-argparse \
    python-wstool \
    curl
    # wget \
    
# Set up the ROS workspace
RUN mkdir -p /home/ros_ws/src 

WORKDIR /home/ros_ws/

COPY baxter.sh .

RUN chmod u+x baxter.sh && \
    ls

# RUN cd ~/ros_ws && \
RUN source /opt/ros/indigo/setup.bash && \
    catkin_make && \
    catkin_make install

# RUN source /opt/ros/indigo/setup.bash \
#     catkin_make && \
#     catkin_make install

RUN cd src && \
    wstool init . && \
    wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter/master/baxter_sdk.rosinstall && \
    wstool update

# RUN source /opt/ros/indigo/setup.bash

# RUN cd /home/ros_ws && \
RUN source /opt/ros/indigo/setup.bash && \
    catkin_make && \
    catkin_make install

# # RUN cd ~/ros_ws && \
# RUN curl -O https://github.com/RethinkRobotics/baxter/raw/master/baxter.sh && \
#     chmod u+x baxter.sh

# Set the default command to start a bash session
CMD ["/bin/bash"]

