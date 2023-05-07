# Base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget xz-utils libglu1-mesa libopenal1 libsndfile1 libgtk-3-0 unzip

# Download and extract Godot Engine
ARG GODOT_VERSION="3.5.2"
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_server.64.zip && \
    unzip Godot_v${GODOT_VERSION}-stable_linux_server.64.zip -d /opt/godot && \
    rm Godot_v${GODOT_VERSION}-stable_linux_server.64.zip

# Set working directory
WORKDIR /opt/godot
RUN ls -l /

COPY . .
COPY /build/linux/ /opt/godot/
# Set entrypoint
#ENTRYPOINT ["/opt/godot/entry.sh']
CMD ./Godot_v3.5.2-stable_linux_server.64 --main-pack web_RTC_server.pck --headless
EXPOSE 11235
