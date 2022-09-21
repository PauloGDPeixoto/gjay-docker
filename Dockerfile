FROM ubuntu:20.04

ARG UID
ARG DEBIAN_FRONTEND=noninteractive

RUN groupadd -g ${UID} usergroup && useradd -m -l -u ${UID} --gid ${UID} --groups user
RUN apt update && apt install -y libaudclient-dev libmpdclient-dev libgsl-dev git
RUN git clone https://github.com/csmall/gjay.git && cd gjay && ln -sf /usr/share/automake-1.16/INSTALL INSTALL && ./autogen.sh && ./configure && make && make install

CMD ["gjay"]

