## How to install and use docker for build

Install docker according to following manuals:

https://docs.docker.com/engine/install/ubuntu/

https://docs.docker.com/engine/install/linux-postinstall/

Pay attention to the section "Manage Docker as a non-root user" a it is critical
for the proper usage of the container.

Create some directory for docker files

```
mkdir docker
cd docker
cp <folder with unpacked sources>/doc/Dockerfile .
cp <folder with unpacked sources>/doc/run_docker.sh .
```

Build docker image using:

```
docker build . -f Dockerfile --build-arg "USER_ID=$(id -u)" --build-arg "USER_GID=$(id -g)" -t u20:latest
```

Prepare directory for product

```
export PRODUCT_WORKDIR=...some_path...
mkdir -p $PRODUCT_WORKDIR
```


Run docker image
`./run_docker.sh -w $PRODUCT_WORKDIR -d u20`

Proceed further with the original build manual.

Hint:
If you build product more than once, you may significantly reduce build time
for the yocto-based domains using yocto's caches.
