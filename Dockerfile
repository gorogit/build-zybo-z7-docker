FROM ubuntu:16.04

#
# base environment
#
RUN apt-get update && \
    apt-get install -y vim less build-essential wget git ncurses-dev bc u-boot-tools libssl-dev

WORKDIR  /home

#
# install linaro toolchain v7.2-2017.11
#
RUN wget -q https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/arm-linux-gnueabi/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz && \
    tar xf gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz && \
    rm gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz

ENV PATH $PATH:/home/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi/bin
ENV CROSS_COMPILE=arm-linux-gnueabi-

#
# linux-xlinx
#
RUN git clone -b zybo_z7 --depth 1 https://github.com/gorogit/linux-xlnx.git

#
# u-boot
#
RUN git clone -b zynq-z7 --depth 1 https://github.com/gorogit/u-boot.git
