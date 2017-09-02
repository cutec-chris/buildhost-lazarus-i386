Lazarus Build VM for Linux i386
------------------------------
 
- [Introduction](#introduction)
- [Installation](#installation)
- [Quick Start](#quick-start)

With this Docker image you can build Lazarus Applications without installing Lazarus or Freepascal

# Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/cutec/buildhost-lazarus-i386/)

# Compiling your Application
```bash
docker run -it --rm -v ~/myApp:/root/app cutec/buildhost-lazarus-i386 lazbuild /root/app/myApp.lpi
```     