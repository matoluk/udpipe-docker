#!/bin/bash
udpipe=__udpipe-ud-1.2-160523
cd $udpipe
for i in *
do
  if [[ $i == *".udpipe" ]]; then
    cd ..
    cp $udpipe/$i .
    docker build --build-arg model=$i -t $i .
    rm $i
    cd $udpipe
  fi
done
