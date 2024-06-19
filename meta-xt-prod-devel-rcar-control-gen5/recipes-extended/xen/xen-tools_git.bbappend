RDEPENDS:${PN} += " \
    util-linux-prlimit \
"

RRECOMMENDS:${PN}:remove = " qemu"
