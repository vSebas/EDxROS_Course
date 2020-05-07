#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/sebastian/ROS/EDx_ROS/hrwros_ws/src/hrwros/hrwros_utilities"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/sebastian/ROS/EDx_ROS/hrwros_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/sebastian/ROS/EDx_ROS/hrwros_ws/install/lib/python2.7/dist-packages:/home/sebastian/ROS/EDx_ROS/hrwros_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/sebastian/ROS/EDx_ROS/hrwros_ws/build" \
    "/usr/bin/python2" \
    "/home/sebastian/ROS/EDx_ROS/hrwros_ws/src/hrwros/hrwros_utilities/setup.py" \
    build --build-base "/home/sebastian/ROS/EDx_ROS/hrwros_ws/build/hrwros/hrwros_utilities" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/sebastian/ROS/EDx_ROS/hrwros_ws/install" --install-scripts="/home/sebastian/ROS/EDx_ROS/hrwros_ws/install/bin"
