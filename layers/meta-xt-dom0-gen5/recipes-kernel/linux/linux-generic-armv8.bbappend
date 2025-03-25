FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

BRANCH = "v6.1.102/rcar-5.2.0.rc11_vpf.rc16"
SRCREV = "ff8c165e0ab6970380f0ca8ac5561bfec1a816d7"
LINUX_VERSION = "6.1.102"

SRC_URI = "\
    git://github.com/renesas-rcar/linux-bsp.git;protocol=https;branch=${BRANCH} \
    file://defconfig \
"
