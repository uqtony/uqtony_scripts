MY_ANDROID=$(pwd)
docker run --privileged -it -v ${MY_ANDROID}:/home/$(id -un)/android_src 'nxp-android-build'
