FROM ubuntu:20.04
LABEL maintainer="Your Name <youremail@example.com>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install \
    wget \
    x11-utils \
    libglu1-mesa \
    libgl1-mesa-glx \
    libxcursor1 \
    libxi6 \
    libxinerama1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libasound2 \
    libpulse0 \
    libfreetype6 \
    libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG EXPORT_NAME
ARG GODOT_VERSION
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip && \
    unzip Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip && \
    mv Godot_v${GODOT_VERSION}-stable_linux_headless.64 /usr/local/bin/godot && \
    chmod +x /usr/local/bin/godot && \
    rm -rf Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip

WORKDIR /app
RUN mkdir build/linux
COPY ./build/linux/$EXPORT_NAME.x86_64 .
ENTRYPOINT ["./test-project.x86_64"]
