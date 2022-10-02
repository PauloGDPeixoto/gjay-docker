FROM ubuntu:12.04

ARG UID
ARG DEBIAN_FRONTEND=noninteractive
ARG GJAY_VERSION=0.3.2

RUN groupadd -g ${UID} gjay && useradd -m gjay -l -u ${UID} --gid ${UID} && \
    mkdir -p /home/gjay/.local/share && chown gjay. /home/gjay/.local -R
RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y autopoint autoconf automake audacious audacious-dev \
    curl libflac-dev libmpdclient-dev libgtk2.0 libgtk2.0-dev libgsl0-dev \
    libvorbis-dev vorbis-tools mpg321 dbus-x11 git
#RUN git clone https://github.com/csmall/gjay.git && cd gjay && \
#    ln -sf /usr/share/automake-1.16/INSTALL INSTALL && ./autogen.sh && \
#    ./configure -- && make && make install
RUN mkdir /opt/gjay && cd /opt/gjay && \
    curl -OL https://github.com/csmall/gjay/archive/refs/tags/${GJAY_VERSION}.tar.gz && \
    tar zxvf ${GJAY_VERSION}.tar.gz && cd gjay-${GJAY_VERSION} && \
    ln -sf /usr/share/automake-1.16/INSTALL INSTALL && ./autogen.sh && \
    ./configure --prefix=/opt/gjay && make && make install && ln -sf /opt/gjay/bin/gjay /usr/local/bin/

CMD ["gjay", "-v", "5"]

