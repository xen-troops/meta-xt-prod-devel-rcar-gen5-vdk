FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

BRANCH = "v2025.01/rcar-7.0.0.rc2"
SRCREV = "ad4e16cb4a9cc88b469bef8ff3e80f9657031786"

SRC_URI:append = "\
    file://0001-gen5-vdk-switch-to-PL011.patch \
    file://0002-gen5-vdk-set-proper-environment-for-xen-booting.patch \
    file://0003-gen5-vdk-disable-CONFIG_ARCH_FIXUP_FDT_MEMORY.patch \
"
