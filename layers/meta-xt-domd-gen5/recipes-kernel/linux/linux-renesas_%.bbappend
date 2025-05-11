FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"
BRANCH = "${XT_KERNEL_BRANCH}"
SRCREV = "${XT_KERNEL_REV}"

ADDITIONAL_DEVICE_TREES = "${XT_DEVICE_TREES}"

SRC_URI = "${RENESAS_BSP_URL};nocheckout=1;branch=${BRANCH};protocol=https"

SRC_URI += " \
    file://defconfig \
    file://vsock.cfg \
    file://chosen.dtsi;subdir=git/arch/arm64/boot/dts/renesas \
    file://r8a78000-ironhide.dts;subdir=git/arch/arm64/boot/dts/renesas \
"

KBUILD_DEFCONFIG = ""
KERNEL_DEVICETREE = ""
KCONFIG_MODE = "--allnoconfig"

# Add ADDITIONAL_DEVICE_TREES to SRC_URIs and to KERNEL_DEVICETREEs
python __anonymous () {
    for fname in (d.getVar("ADDITIONAL_DEVICE_TREES") or "").split():
        dts = fname[:-3] + "dts"
        d.appendVar("SRC_URI", " file://%s;subdir=git/arch/${ARCH}/boot/dts/renesas"%dts)
        dtb = fname[:-3] + "dtb"
        d.appendVar("KERNEL_DEVICETREE", " renesas/%s"%dtb)
}
