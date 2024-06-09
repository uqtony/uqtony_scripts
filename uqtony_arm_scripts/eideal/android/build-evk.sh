source build/envsetup.sh
lunch evk_8mm-userdebug
./imx-make.sh -j4 2>&1 | tee build-log.txt
