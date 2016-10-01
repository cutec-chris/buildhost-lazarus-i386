FROM ubuntu:15.10 
MAINTAINER Christian Ulrich
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget git
RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN apt-get install gtk2-engines-pixbuf:i386 libgl1-mesa-dri:i386 ia32-libs-multiarch:i386 ia32-libs
RUN apt-get -y install ia32-libs lazarus:i386 libusb-dev:i386 libsane-dev:i386
RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]