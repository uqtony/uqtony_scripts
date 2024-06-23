[Summary]

1. Create Docker Image with DockerFile provided by NXP.
2. Start up a new container with Docker Image.
3. Build Android SDK.
4. Beware versions of following:
    1. GCC_CROSS_COMPILE_TOOL_CHAIN
    2. CLANG

[Details]

**Create Docker Image with DockerFile provided by NXP.**

1. After NXP Android13 source code, DockFile can be found in the directory: “${MY_ANDROID}/device/nxp/common/dockerbuild/”.
2. Build the Docker image: 

$ cd ${Dockerfile_path}

# ${Dockerfile_path} can be ${MY_ANDROID}/device/nxp/common/dockerbuild/, or
# another path that you moved the Dockerfile to.

$ docker build --no-cache --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) -t <docker_image_name> .

# <docker_image_name> can be whatever you want, such as 'android-build'.
# '.' means using the current directory as the build context, it specifies
# where to find the files for the “context” of the build on the Docker daemon.

**Start up a new container with Docker Image.**

Start up a new container and mount  your Android source codes to it: 

$ docker run --privileged -it -v ${MY_ANDROID}:/home/$(id -un)/android_src <docker_image_name>

**Build Android SDK.**

Build process example: 

$ cd ~/android_src; source build/envsetup.sh
$ lunch evk_8mm-userdebug
$ ./imx-make.sh -j4 2>&1 | tee build-log.txt

**Beware versions of following:**

1. **GCC_CROSS_COMPILE_TOOL_CHAIN**
2. **CLANG**

1. GCC_CROSS_COMPILE_TOOL_CHAIN
    1. Example: for Android 14 or below, suggest to use “10.3-2021.07”.
    2. Change following in DockerFile
    
    ENV GCC_CROSS_COMPILE_TOOL_CHAIN gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu
    RUN curl -o ${GCC_CROSS_COMPILE_TOOL_CHAIN}.tar.xz https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-a/10.3-2021.07/binrel/
    
    Command above try to download package of GCC Cross Compile Tool Chain.
    

1. CLANG
    1. Example: for Android 14 or below, suggest to use tag=”android-14.0.0_r45”.
    2. Change following in DockerFile 
    
    RUN git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 --single-branch --depth=1 -b android-14.0.0_r45 /opt/prebuilt-android-clang
    
    Command above try to clone Clang project from Google Source Code Center: 
    
    https://android.googlesource.com
    

[Conclusion]

Some Android SDK can only be built with specified “GCC_CROSS_COMPILE_TOOL_CHAIN” and “CLANG”.
