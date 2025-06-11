FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

BRANCH = "v6.1.102/rcar-5.2.0.rc11_vpf.rc20"
SRCREV = "45f7f75346bb60ea9838eb0e0a33f178adb62369"
LINUX_VERSION = "6.1.102"

SRC_URI = "\
    git://github.com/renesas-rcar/linux-bsp.git;protocol=https;branch=${BRANCH} \
    file://defconfig \
    file://random.cfg \
"
