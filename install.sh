cd $(dirname "$0")
cd src
tar -xf itk-snap-src.tar
cd itk-snap-src
git checkout 562f52acab8668bae681e206b20d559e59e2ef37
git submodule init
git submodule update
mkdir build
cd build
mkdir itkv3
cd itkv3
cp ../../../../dependencies/itkKernelFunction.h .
cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_CXX_FLAGS="-fPIC -I'itkv3' -DITKV3_COMPATIBILITY=1" -DBUILD_OUTSIDE_INSIGHT_APPLICATIONS=ON -DBUILD_TESTING=OFF -DFLTK_FLUID_EXECUTABLE="/usr/bin/fluid"
make
sudo make install