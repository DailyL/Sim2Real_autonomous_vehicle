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
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/dianzhao/real_duckie_catkin_ws/src/complete_image_pipeline"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/dianzhao/real_duckie_catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/dianzhao/real_duckie_catkin_ws/install/lib/python3/dist-packages:/home/dianzhao/real_duckie_catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/dianzhao/real_duckie_catkin_ws/build" \
    "/usr/bin/python3" \
    "/home/dianzhao/real_duckie_catkin_ws/src/complete_image_pipeline/setup.py" \
     \
    build --build-base "/home/dianzhao/real_duckie_catkin_ws/build/complete_image_pipeline" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/dianzhao/real_duckie_catkin_ws/install" --install-scripts="/home/dianzhao/real_duckie_catkin_ws/install/bin"
