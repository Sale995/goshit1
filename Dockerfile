FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xorg-dev libglu1-mesa-dev libx11-dev libxcursor-dev libxinerama-dev libxi-dev libxrandr-dev && \
    rm -rf /var/lib/apt/lists/*

ARG EXPORT_NAME
ARG GODOT_VERSION

COPY $EXPORT_NAME.x86_64 /app/$EXPORT_NAME.x86_64

CMD ["/app/$EXPORT_NAME.x86_64"]
