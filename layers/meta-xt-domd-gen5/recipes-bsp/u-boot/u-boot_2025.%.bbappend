FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

BRANCH = "v2025.01/rcar-7.0.0.rc2_vpf.rc3"
SRCREV = "6f888d4f1d8771dcabf06a3f3dfa276b8caf0bff"

SRC_URI:append = "\
    file://0001-gen5-vdk-switch-to-PL011.patch \
    file://0002-gen5-vdk-set-proper-environment-for-xen-booting.patch \
    file://0003-gen5-vdk-disable-CONFIG_ARCH_FIXUP_FDT_MEMORY.patch \
"
