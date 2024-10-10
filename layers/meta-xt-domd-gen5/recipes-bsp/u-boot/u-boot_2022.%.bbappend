FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

BRANCH = "v2022.01/rcar-6.0.0.rc6_vpf.rc8"
SRCREV = "6897a8bfc7c2a0d3a2b4d81f68b85cbf9bc6f242"

SRC_URI:append = "\
    file://0001-gen5-vdk-set-proper-environment-for-xen-booting.patch \
"
