FROM ubuntu:16.04

ARG UID
ARG DEBIAN_FRONTEND=noninteractive
#ARG GJAY_VERSION=0.3.2

RUN groupadd -g ${UID} gjay && useradd -m gjay -l -u ${UID} --gid ${UID} && mkdir -p /home/gjay/.local/share && chown gjay. /home/gjay/.local -R
RUN apt-get update && apt-get install -y autopoint autoconf automake libaudclient-dev libmpdclient-dev libgsl-dev dbus-x11 git
RUN git clone https://github.com/csmall/gjay.git && cd gjay && ln -sf /usr/share/automake-1.16/INSTALL INSTALL && ./autogen.sh && ./configure -- && make && make install
#RUN mkdir /opt/gjay && cd /opt/gjay && curl -OL https://github.com/csmall/gjay/archive/refs/tags/${GJAY_VERSION}.tar.gz && tar zxvf ${GJAY_VERSION}.tar.gz && cd gjay-${GJAY_VERSION} && ln -sf /usr/share/automake-1.16/INSTALL INSTALL && ./autogen.sh && ./configure --prefix=/opt/gjay && make && make install

CMD ["gjay", "-v", "5"]

