# meta-xt-rcar-gen5 #

This repository contains Renesas R-Car Gen5 VDK specific Yocto layers for
Xen Troops distro. Some layers in this repository are product-independent.
They provide common facilities that may be used by any xt-based product
that runs on Renesas Gen5-based platforms.

Those layers *may* be added and used manually, but they were written
with [Moulin](https://moulin.readthedocs.io/en/latest/) build system,
as Moulin-based project files provide correct entries in local.conf

# Status

This is initial release, that supports running of 2 separate Xen domains - thin
Dom0 and driver domain DomD. It is based on following projects:
- U-Boot 2022.01
- Dom0 Linux 5.10.41
- DomD Linux 5.10.147
- Xen 4.19.0

# External dependencies

This product is based on Synopsys VDK releases and Synopsys Virtualizer software.
Currently it is expected that user has and will run it with Synopsys Virtualizer
Runtime U-2023.03-SP2 and Synopsys VDK release 3.5.1 (with changes described in
"VDK configuration" section of EPAM release notes).

# Building

## Requirements

1. Ubuntu 18.0+ or any other Linux distribution which is supported by Poky/OE
2. Development packages for Yocto. Refer to [Yocto
   manual](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages).
3. You need `Moulin` of version 0.15 or newer installed in your
   PC. Recommended way is to install it for your user only: `pip3
   install --user git+https://github.com/xen-troops/moulin`. Make sure
   that your `PATH` environment variable includes
   `${HOME}/.local/bin`.
4. Ninja build system: `sudo apt install ninja-build` on Ubuntu

## Build yaml file

Currently this project does not have dedicated repository, so recepies and build
yaml are shared alongside with release binaries in release archieve and named
`prod-devel-rcar-gen5-vdk.yaml`. To initiate build you need to have only this
file in target build directory:

```
$ mkdir "your builds dir"/rcar-gen5-vdk-build/
$ cp "unpacked release archive dir"/meta-xt-prod-devel-rcar-gen5-vdk/prod-devel-rcar-gen5-vdk.yaml "your builds dir"/rcar-gen5-vdk-build/
```

Also, due to sharing this project as archive instead of remote repository, you
need to provide local path for it inside `prod-devel-rcar-gen5-vdk.yaml` before
build. To do this, please find following line and substitute it with location
from unpacked release archive:

Change:
```
    - type: git
      url: <local repo full path>
      rev: master
```

To:

```
    - type: git
      url: /"unpacked release archive dir"/meta-xt-prod-devel-rcar-gen5-vdk/
      rev: master
```

## Building

After previous steps you can start building. Moulin is used to generate Ninja build
file, just run following command in directory created in previous section:

```
$ moulin prod-devel-rcar-gen5-vdk.yaml
```

Moulin will generate `build.ninja` file. After that run following command to
build the target images:

```
$ ninja dom0 virtio.img
```

This will take some time and disk space as it builds 2 separate Yocto images.
