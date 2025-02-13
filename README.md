# meta-xt-rcar-gen5 #

This repository contains Renesas R-Car Gen5 VDK specific Yocto layers for
Xen Troops distro. Some layers in this repository are product-independent.
They provide common facilities that may be used by any xt-based product
that runs on Renesas Gen5-based platforms.

Those layers *may* be added and used manually, but they were written
with [Moulin](https://moulin.readthedocs.io/en/latest/) build system,
as Moulin-based project files provide correct entries in local.conf

# Status

This VDK release, that supports running of 3 separate Xen domains - thin
Dom0, driver domain DomD and DomU. It is based on following projects:
- U-Boot 2022.01
- Dom0 Linux 5.10.41
- DomD Linux 6.1.102
- DomU Linux 6.1.102
- Xen 4.19.0

# External dependencies

This product is based on Synopsys VDK releases and Synopsys Virtualizer software.
Currently it is expected that user has and will run it with Synopsys Virtualizer
Runtime U-2023.03-SP2 and Synopsys VDK release 3.12.0 (with changes described in
"VDK configuration" section of EPAM release notes).

# How to build the product

## Build inside the docker container

This option is strongly recommended due to the long list of packages that have
to be installed on the host due to the complex nature of the product.
In order to have a reproducible and clean environment we urge you to use the
Docker container, provided in the `doc/` directory.
Please see the corresponding [instruction](doc/Docker.md).

## Requirements for the build without the container

1. Ubuntu 18.0+ or any other Linux distribution which is supported by Poky/OE
2. Development packages for Yocto. Refer to [Yocto
   manual](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages).
3. You need `Moulin` of version 0.27 or newer installed in your
   PC. Recommended way is to install it for your user only: `pip3
   install --user git+https://github.com/xen-troops/moulin`. Make sure
   that your `PATH` environment variable includes
   `${HOME}/.local/bin`.
4. Due to complex nature of this product and a lot of dependencies, it is
   strongly recommended to install this long list of packages, used on a
   different stages of the build:

```
apt-get update

apt-get install -y apt-utils cpio python python3 python3-pip \
python3-pexpect xz-utils debianutils iputils-ping python3-jinja2 pylint3 vim \
locales devscripts debhelper gawk wget diffstat texinfo chrpath socat \
libsdl1.2-dev python-crypto checkpolicy python3-git python3-github bzr pigz m4 \
lftp openjdk-8-jdk git-core rsync gnupg flex bison gperf build-essential zip \
curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev \
x11proto-core-dev libx11-dev lib32z1-dev ccache libgl1-mesa-dev libxml2-utils \
xsltproc unzip bc ninja-build simg2img lz4 zstd python3-pyelftools \
python3-crypto libncurses5 libssl-dev udev sudo expect graphviz adb aapt \
libgtk-3-dev protobuf-compiler dosfstools python3-pygit2

apt-get install --reinstall -y ca-certificates

pip3 install pycryptodomex west protobuf grpcio-tools
```

## Building

This project is located inside [dedicated Gitlab repository](https://jc.gitlab.renesasworkbench.com/rcar-android/meta-xt-prod-devel-rcar-gen5-vdk)
, which contains release tags. To be able to build, please clone it to separate directory.

Pay attention!
This product builds several Linux OS, so the full build from scratch will
take up to 10 hours, depending on your workstation and network bandwith,
and requires about 300 GB of free space on the SSD drive.

To build product from sources you need to go to cloned repository:
```
$ cd <cloned repository path>
```

Use the `moulin` to generate `build.ninja`
```
$ moulin prod-devel-rcar-gen5-vdk.yaml
```

Start the build:
```
$ ninja && ninja boot_artifacts virtio.img
```

# Booting

After building stage output files will appear in your build directory (where
previously `prod-devel-rcar-gen5-vdk.yaml` was placed) - `virtio.img` and
`artifacts` directory with `X5H-boot-artifacts.tar.bz` archive.

To boot them you need to have Virtualizer U-boot config (`UBoot_5_10_41.vpcfg`)
from EPAM release (refer to "External dependencies" section of these document
and "VDK configuration" section of EPAM release notes). This file contains
pathes to target images and addresses that should be used for loading.

To run your images, please, open `UBoot_5_10_41.vpcfg` via Virtualizer and:
- substitute original image pathes with unpacked from `X5H-boot-artifacts.tar.bz`
  Dom0 `Image` and `uInitramfs` are located in `yocto/build-dom0/tmp/deploy/images`
  Xen device tree (`r8a78000-X5H-xen.dtb`), Xen image (`xen-x5h.uImage`),
  U-boot image (`u-boot.bin`) and Xenpolicy (`xenpolicy-4.19-unstable`) are
  located in `yocto/build-domd/tmp/deploy/images` of `X5H-boot-artifacts.tar.bz`
  unpacked archive
- change original `virtio.img` in `VIRTIO` sections of Images tab to `virtio.img`
  from build folder

After this you can run simulation with you own images.
