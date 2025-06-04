#!/bin/bash

# Launch D-Bus only if not already running
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && ! pgrep -u "$USER" -x dbus-daemon > /dev/null; then
    eval "$(dbus-launch --sh-syntax)"
    export DBUS_SESSION_BUS_ADDRESS
    export DBUS_SESSION_BUS_PID
    echo "export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" >> "$XDG_RUNTIME_DIR/dbus-env"
    echo "export DBUS_SESSION_BUS_PID=$DBUS_SESSION_BUS_PID" >> "$XDG_RUNTIME_DIR/dbus-env"
fi

