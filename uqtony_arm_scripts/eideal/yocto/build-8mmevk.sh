MACHINE=imx8mmevk DISTRO=fsl-imx-xwayland source imx-setup-release.sh -b build_fsl-imx-xwayland
bitbake imx-image-full 2>&1 | tee build-log.txt
