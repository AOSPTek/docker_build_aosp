Requirements: 
Create a folder /build and 
sudo mkdir /build && sudo chown $USER:<GROUP> /build
-- Change Group to your group

# To build docker image with necessary packages to build AOSP
docker build -t aosp-builder --build-arg USERNAME=$USER .

# To create and run a container : 
docker run -it --name aosp-container -v /build:/build aosp-builder
