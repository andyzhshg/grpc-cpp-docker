FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git build-essential autoconf libtool pkg-config curl

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc --recursive \
    && cd grpc \
    && make install \
    && cd third_party/protobuf \
    && make install \
    && cd ../../../ && rm -rf grpc

