FROM 32bit/debian
MAINTAINER Christian Ulrich
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget git zip sshpass sudo
RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN apt-get -y install gtk2-engines-pixbuf libgl1-mesa-dri
RUN apt-get -y install libusb-dev libsane-dev sqlite3 postgresql-client fpc
RUN gpg --keyserver hkp://pgp.mit.edu:11371 --recv-keys 6A11800F && \
    gpg --export 6A11800F | sudo apt-key add - &&  \
    echo "deb http://www.hu.freepascal.org/lazarus/ lazarus-stable universe" > lazarus.list && \
    sudo mv -v lazarus.list  /etc/apt/sources.list.d/lazarus.list
ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update
#RUN echo y | sudo apt-get install -y -t lazarus-stable lazarus
#RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]