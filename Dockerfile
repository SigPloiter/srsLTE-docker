FROM ubuntu:latest

COPY ./srsLTE /srsLTE

RUN apt-get update -y && \
apt-get install -y software-properties-common

RUN add-apt-repository ppa:bladerf/bladerf && \
add-apt-repository -y ppa:myriadrf/drivers

RUN apt-get update -y && \
	apt-get install -y cmake \
	libfftw3-dev \
	libmbedtls-dev \
	libboost-program-options-dev \
	libconfig++-dev \
	libsctp-dev \
	libbladerf1 \
	libbladerf2 \
	libbladerf-dev \
	libbladerf-udev \
	libsoapysdr0.7 \
	libsoapysdr-dev

WORKDIR srsLTE/build
RUN cmake ../ && make && make install && ldconfig
RUN ./srslte_install_configs.sh service
