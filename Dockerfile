FROM ubuntu:latest

COPY ./srsRAN /srsRAN

RUN apt-get update -y && \
apt-get install -y software-properties-common


RUN apt-get update -y && \
	apt-get install -y cmake \
	libfftw3-dev \
	libmbedtls-dev \
	libboost-program-options-dev \
	libconfig++-dev \
	libsctp-dev \
	libzmq3-dev

WORKDIR srsRAN/build
RUN cmake ../ && make && make install && ldconfig
RUN ./srslte_install_configs.sh service
