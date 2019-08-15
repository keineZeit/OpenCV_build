set "opencvSource=opencv-4.1.1"
set "opencvExtraModules=opencv_contrib-4.1.1/modules"
set "opencvBuild=%opencvSource%\build"
set "compiler=Visual Studio 16 2019"
set "buildType=Release"

set "python2_executable=C:/Python27/python.exe"
set "python2_include_dir=C:/Python27/include"
set "python2_library=C:/Python27/libs/python27.lib"
set "python2_numpy_include_dirs=C:/Python27/Lib/site-packages/numpy/core/include"
set "python2_packages_path=C:/Python27/Lib/site-packages"

set "python3_executable=C:/Users/root/Anaconda3/python.exe"
set "python3_include_dir=C:/Users/root/Anaconda3/include"
set "python3_library=C:/Users/root/Anaconda3/libs/python37.lib"
set "python3_numpy_include_dirs=C:/Users/root/Anaconda3/lib/site-packages/numpy/core/include"
set "python3_packages_path=C:/Users/root/Anaconda3/Lib/site-packages"

cmake ^
-B"%opencvBuild%/" ^
-H"%opencvSource%/" ^
-G"%compiler%" ^
-Ax64 ^
-DCMAKE_BUILD_TYPE=%buildType% ^
-DBUILD_opencv_world=ON ^
-DINSTALL_TESTS=OFF ^
-DINSTALL_C_EXAMPLES=OFF ^
-DBUILD_EXAMPLES=OFF ^
-DOPENCV_EXTRA_MODULES_PATH="%opencvExtraModules%/" ^
-DWITH_CUDA=ON ^
-DCUDA_FAST_MATH=ON ^
-DWITH_CUBLAS=ON ^
-DCUDA_ARCH_BIN=7.5 ^
-DCUDA_ARCH_PTX=7.5 ^
-DBUILD_opencv_python_bindings_generator=ON ^
-DBUILD_opencv_python2=ON ^
-DPYTHON2_EXECUTABLE="%python2_executable%" ^
-DOPENCV_PYTHON2_VERSION=2.7.16 ^
-DPYTHON2_INCLUDE_DIR="%python2_include_dir%" ^
-DPYTHON2_LIBRARY="%python2_library%" ^
-DPYTHON2_NUMPY_INCLUDE_DIRS="%python2_numpy_include_dirs%" ^
-DPYTHON2_PACKAGES_PATH="%python2_packages_path%" ^
-DBUILD_opencv_python3=ON ^
-DPYTHON3_EXECUTABLE="%python3_executable%" ^
-DOPENCV_PYTHON3_VERSION=3.7.3 ^
-DPYTHON3_INCLUDE_DIR="%python3_include_dir%" ^
-DPYTHON3_LIBRARY="%python3_library%" ^
-DPYTHON3_NUMPY_INCLUDE_DIRS="%python3_numpy_include_dirs%" ^
-DPYTHON3_PACKAGES_PATH="%python3_packages_path%" ^
-DBUILD_PROTOBUF=ON

cmake --build %opencvBuild% --target ALL_BUILD --config Release

cmake --build %opencvBuild% --target INSTALL --config Release
