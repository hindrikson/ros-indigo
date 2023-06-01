# Instructions

## To Build the image run the following command
sudo docker build --no-cache -t <image_name> .
    example:
sudo docker build --no-cache -t ros-indigo:v3 .

## To start a container
docker run \
    -it \
    %% -v ~/catkin_ws:/root/catkin_ws \
    %% -v ~/.ssh:/root/.ssh \
    --network host \
    --env ROS_MASTER_URI=http://<your hostname>:11311 \
    --name ros
    ros:melodic[-desktop-full]

sudo docker run -it --name ros-container --network host ros-indigo-t
	

