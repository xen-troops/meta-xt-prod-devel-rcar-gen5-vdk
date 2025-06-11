FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

BRANCH = "v2025.01/rcar-7.0.0.rc2_vpf.rc4"
SRCREV = "8d4340bf361b53ce7a0c17d51816bdf177d546f8"

SRC_URI:append = "\
    file://0001-gen5-vdk-switch-to-PL011.patch \
    file://0002-gen5-vdk-set-proper-environment-for-xen-booting.patch \
    file://0003-gen5-vdk-disable-CONFIG_ARCH_FIXUP_FDT_MEMORY.patch \
"
