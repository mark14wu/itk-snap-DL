以 Arch Linux 发行版为例，经过以下 18 步成功从源码编译并安装 itk-snap
1. 从亮神(sld)处复制源代码仓库itk-snap-src
2. 安装以下依赖
    1. `insight-toolkit 4.13`
    2. `vtk`
    3. `qt5-base`
    4. `fltk`
3. 除了上述依赖，还可能需要安装以下依赖（在 Arch Linux 系统上测试得到如下列表）：
    1. glew
    2. netcdf
    3. proj
    4. mariadb
    5. gdal
    6. unixodbc
    7. libgdcm
    8. libvtkgdcm-dev
4. 安装完依赖后， `cd itk-snap-src`
5. `git checkout 562f52acab8668bae681e206b20d559e59e2ef37`  
    （这长串 hash 是 itk-snap 的发布分支）
6. `git submodule init`
7. `git submodule update`
8. `mkdir build`
9. `cd build`
10. `mkdir itkv3`
11. `cd itkv3`
12. `nano itkKernelFunction.h`
13. 将[这个网页][1]的代码复制到 itkKernelFunction.h中，保存
14. `gcc --version`来检查 gcc 版本，如果是8以及以上，那么需要安装 `gcc-7`并且修改环境变量
    1. 安装`gcc-7`
    2. `export CC=/usr/bin/gcc-7`
    3. `export CXX=/usr/bin/g++-7`
15. 输入下列命令：`cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_CXX_FLAGS="-fPIC -I'itkv3' -DITKV3_COMPATIBILITY=1" -DBUILD_OUTSIDE_INSIGHT_APPLICATIONS=ON -DBUILD_TESTING=OFF -DFLTK_FLUID_EXECUTABLE="/usr/bin/fluid"`
16. `make`
17. `sudo make install`
18. 应该就完成了。如果有错误，根据报错提示信息来一一解决即可。

  [1]: https://aur.archlinux.org/cgit/aur.git/tree/itkKernelFunction.h?h=itk-snap