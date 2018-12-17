FROM amazonlinux:1

MAINTAINER TT

RUN yum -y update && \
    yum -y groupinstall "Development tools" && \
    rm -rf /var/cache/yum/* && \
    yum clean all

WORKDIR /usr/local/src

RUN curl --http1.1 -O https://common-lisp.net/project/ecl/static/files/release/ecl-16.1.3.tgz && \
    tar xfz ecl-16.1.3.tgz && \
    cd ecl-16.1.3 && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    make clean && \
    cd .. && \
    rm -rf ecl-16.1.3*

WORKDIR /root
CMD /usr/local/bin/ecl
