ARG PYTHON_VERSION="PYTHON_VERSION_NOT_SET"
ARG ARCH="ARCH_NOT_SET"

FROM ${ARCH}/ubuntu:18.04

ARG ARCH
ARG PYTHON_VERSION
ENV QEMU_EXECVE 1
ENV DEBIAN_FRONTEND=noninteractive

# copy QEMU
COPY ./assets/qemu/${ARCH}/ /usr/bin/

# install python and cmake
RUN apt-get update && \
  apt-get install -y \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-pip \
    python${PYTHON_VERSION}-setuptools \
    python${PYTHON_VERSION}-wheel

# install python libraries
RUN pip${PYTHON_VERSION} install \
    bdist-wheel-name

# install building script
COPY ./assets/build.sh /build.sh

# prepare environment
ENV ARCH=${ARCH}
ENV PYTHON_VERSION=${PYTHON_VERSION}
RUN mkdir /source
RUN mkdir /out
WORKDIR /source

# define command
CMD /build.sh