<<<<<<< HEAD
FROM ubuntu:18.04 AS builder
=======
FROM ubuntu
>>>>>>> 30e709b (Add files via upload)
RUN apt-get update && \
    apt-get install -y git g++ make
RUN mkdir -p /opt/src && \
    cd /opt/src && \
    git clone https://github.com/ufal/udpipe.git && \
    cd udpipe/src && \
    make && \
    mkdir -p /opt/udpipe && \
    cp /opt/src/udpipe/src/udpipe /opt/udpipe
<<<<<<< HEAD

FROM ubuntu:18.04
WORKDIR /opt/udpipe
ARG model
ENV LANGMODEL=$model
COPY $model .
COPY run.sh .
COPY --from=builder /opt/udpipe/udpipe .
=======
WORKDIR /opt/udpipe
ARG model
ENV LANGMODEL=$model
COPY $LANGMODEL .
COPY run.sh .
>>>>>>> 30e709b (Add files via upload)
ENTRYPOINT ["./run.sh"]
CMD ["--tokenize", "--tag", "--parse"]
