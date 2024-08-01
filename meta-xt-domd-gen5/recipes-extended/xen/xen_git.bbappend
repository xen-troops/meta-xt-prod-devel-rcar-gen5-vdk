FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:spider = " \
    file://0001-gen5-vdk-workaround-decrease-boot-delay-for-Dom0.patch \
    file://enable_ioreq.cfg \
    file://early_printk_spider.cfg \
    file://disable_tee.cfg \
    file://disable_ipmmu_vmsa.cfg \
    file://enable_smmu_v3.cfg \
"

do_configure:append() {
    # merge configuration fragments manually using kconfig's native facilities
    ${S}/xen/tools/kconfig/merge_config.sh -m -O ${B}/xen ${B}/xen/.config ${WORKDIR}/*.cfg
}
