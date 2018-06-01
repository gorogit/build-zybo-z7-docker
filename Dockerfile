FROM ubuntu:16.04

#
# base environment
#
RUN apt-get update && \
    apt-get install -y vim less build-essential wget git ncurses-dev bc u-boot-tools libssl-dev sudo


#
# create build user
#
RUN id build 2>/dev/null || useradd --uid 30000 --create-home build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers
USER build
WORKDIR  /home/build

#
# install linaro toolchain v7.2-2017.11
#
RUN wget -q https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/arm-linux-gnueabi/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz && \
    tar xf gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz && \
    rm gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz

ENV PATH $PATH:/home/build/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi/bin
ENV CROSS_COMPILE=arm-linux-gnueabi-
ENV ARCH=arm

#
# linux-xlinx
#
RUN git clone -b zybo_z7 --depth 1 https://github.com/gorogit/linux-xlnx.git

#
# u-boot
#
RUN git clone -b zynq-z7 --depth 1 https://github.com/gorogit/u-boot.git

#
# startup command
#
CMD "/bin/bash"
