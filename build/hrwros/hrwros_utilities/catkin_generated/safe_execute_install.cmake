execute_process(COMMAND "/home/sebastian/ROS/EDx_ROS/hrwros_ws/build/hrwros/hrwros_utilities/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/sebastian/ROS/EDx_ROS/hrwros_ws/build/hrwros/hrwros_utilities/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
