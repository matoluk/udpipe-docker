FROM ubuntu:18.04 AS builder
RUN apt-get update && \
    apt-get install -y git g++ make
RUN mkdir -p /opt/src && \
    cd /opt/src && \
    git clone https://github.com/ufal/udpipe.git && \
    cd udpipe/src && \
    make && \
    mkdir -p /opt/udpipe && \
    cp /opt/src/udpipe/src/udpipe /opt/udpipe

FROM ubuntu:18.04
WORKDIR /opt/udpipe
ARG model
ENV LANGMODEL=$model
COPY $model .
COPY run.sh .
COPY --from=builder /opt/udpipe/udpipe .
ENTRYPOINT ["./run.sh"]
CMD ["--tokenize", "--tag", "--parse"]
