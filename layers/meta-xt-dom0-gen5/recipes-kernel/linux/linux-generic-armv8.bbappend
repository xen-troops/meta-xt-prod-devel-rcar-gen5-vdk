FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

BRANCH = "v6.1.102/rcar-5.2.0.rc11_vpf.rc19"
SRCREV = "7ce93860034c69d9536390eedd5dee8a8eea755a"
LINUX_VERSION = "6.1.102"

SRC_URI = "\
    git://github.com/renesas-rcar/linux-bsp.git;protocol=https;branch=${BRANCH} \
    file://defconfig \
    file://random.cfg \
"
