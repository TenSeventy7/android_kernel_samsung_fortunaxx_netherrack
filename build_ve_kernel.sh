#!/bin/bash

# export ARCH=arm
export CROSS_COMPILE=$HOME/Toolchains/arm-eabi-4.8-ubertc/bin/arm-eabi-

export PATH="$HOME/Toolchains/arm-eabi-4.8-ubertc/bin/:$PATH"
export ARCH=arm
export SUBARCH=arm

mkdir output

make -C $(pwd) O=output VARIANT_DEFCONFIG=msm8916_sec_fortunave3g_eur_defconfig msm8916_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -C $(pwd) O=output

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
