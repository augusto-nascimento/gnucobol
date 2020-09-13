FROM debian:9
LABEL maintainer="augusto.r.nascimento@gmail.com"

ENV DEPENDENCIES="libltdl-dev libdb-dev libgmp-dev libmpfr-dev libmpc-dev libjson-c-dev libncurses5-dev libncursesw5-dev"
ENV BUILD_PACKAGES="wget build-essential"

RUN apt-get update -y \
    && apt-get install -y ${BUILD_PACKAGES} \
    && apt-get install -y ${DEPENDENCIES} \
    && wget https://downloads.sourceforge.net/project/gnucobol/gnucobol/3.1/gnucobol-3.1-rc1.tar.xz \
    && tar -xf gnucobol-3.1-rc1.tar.xz \
    && cd /gnucobol-3.1-rc1 \
    && ./configure \
    && make \
    && make install \
    && ldconfig \
    && cd .. / \
    && rm -rf gnucobol-3.1-rc1 gnucobol-3.1-rc1.tar.xz \
    && apt remove --purge -y ${BUILD_PACKAGES}\
    && apt clean -y && apt autoclean -y && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /oscobol/src/
ENTRYPOINT /bin/bash