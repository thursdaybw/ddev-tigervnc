#!/bin/bash

#ddev-generated
VNC_DIR="${HOME}/.vnc"
export DISPLAY=:1

# Set VNC password
PASSWORD=${VNC_PASSWORD:-password}
echo $PASSWORD | vncpasswd -f > ${VNC_DIR}/passwd
chmod 600 ${VNC_DIR}/passwd

# Start VNC server
vncserver $DISPLAY -geometry 2560x1600 -depth 24 -localhost no
#vncserver $DISPLAY -geometry 1280x800 -depth 24 -localhost no

# Keep the script running to allow supervisor to manage it
tail -f ${VNC_DIR}/*.log

