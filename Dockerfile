FROM ioft/i386-ubuntu
MAINTAINER Christian Ulrich
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget git zip
RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN apt-get -y install gtk2-engines-pixbuf libgl1-mesa-dri
RUN apt-get -y install lazarus libusb-dev libsane-dev sqlite3 postgresql-client
RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]