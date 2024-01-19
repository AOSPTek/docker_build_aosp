FROM ubuntu:22.04

# Set username same as host
ARG USERNAME
RUN useradd -m $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME:password" | chpasswd

# Create a shared folder called build under /
RUN mkdir /build && chown $USERNAME:$USERNAME /build

# Install sudo
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y sudo

# Install necessary packages for building AOSP
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    git-core \
    gnupg \
    flex \
    bison \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    libc6-dev-i386 \
    libncurses5 \
    x11proto-core-dev \
    libx11-dev \
    lib32z1-dev \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    fontconfig \ 
    python3 \
    python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1


# Switch to the user
USER $USERNAME

# Set working directory
WORKDIR /build

# Entry point
CMD ["/bin/bash"]

