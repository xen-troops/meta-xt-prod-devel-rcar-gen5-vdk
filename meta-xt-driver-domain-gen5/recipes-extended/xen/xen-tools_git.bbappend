PACKAGECONFIG:append = " \
    xsm \
"

FILES:${PN}-flask = " \
    /boot/xenpolicy-${XEN_REL}* \
"

SYSTEMD_SERVICE:${PN}-xencommons:remove = " proc-xen.mount"
FILES:${PN}-xencommons:remove = " ${systemd_unitdir}/system/proc-xen.mount"

SYSTEMD_SERVICE:${PN}-proc-xen = "proc-xen.mount"
FILES:${PN}-proc-xen = "${systemd_unitdir}/system/proc-xen.mount"

SYSTEMD_PACKAGES += "\
    ${PN}-proc-xen \
"

RDEPENDS:${PN}-devd += " \
    ${PN}-proc-xen \
"

RDEPENDS:${PN}-xencommons += " \
    ${PN}-proc-xen \
"

PACKAGES += "\
    ${PN}-proc-xen \
"
