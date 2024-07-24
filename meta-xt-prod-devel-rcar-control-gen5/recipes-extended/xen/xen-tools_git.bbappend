FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://0001-console-temporary-decrease-polling-period.patch \
"

RDEPENDS:${PN} += " \
    util-linux-prlimit \
"

RRECOMMENDS:${PN}:remove = " qemu"

# As all needed modules are already compiled to kernel,
# we do not need this config
FILES:${PN}-xencommons:remove = "\
    ${nonarch_libdir}/modules-load.d/xen.conf \
"

do_install:append() {
    rm -f ${D}/${nonarch_libdir}/modules-load.d/xen.conf
    rm -rf ${D}/${nonarch_libdir}/modules-load.d
}
