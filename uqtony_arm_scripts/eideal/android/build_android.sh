source build/envsetup.sh
lunch eideal_8mm-userdebug
./eideal-imx-make.sh -j4 2>&1 | tee build-log.txt
