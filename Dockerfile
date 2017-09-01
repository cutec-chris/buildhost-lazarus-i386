FROM 32bit/debian
MAINTAINER Christian Ulrich
RUN apt-get -y update && \ 
    apt-get -y install git sudo fpc fpc-source binutils build-essential zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc

RUN apt-get clean && apt-get autoremove -y

RUN svn co http://svn.freepascal.org/svn/lazarus/branches/fixes_1_6 lazarus
RUN cd lazarus && \
    make bigide && \
    make install