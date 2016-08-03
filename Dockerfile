FROM ljl/supervisor:1.0
MAINTAINER qida

ADD init.sh /root/init.sh
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV HOME /root
WORKDIR /root

# Download leanote and mongodb.
RUN wget http://sunqida.qiniudn.com/leanote-linux-amd64-v2.0.bin.tar.gz -O leanote.tar.gz && \
    wget http://sunqida.qiniudn.com/mongodb-linux-x86_64-ubuntu1204-3.2.8.tgz -O mongodb.tgz
    
# Extract them.
RUN tar -xvf leanote.tar.gz && \
    tar -xvf mongodb.tgz
    
#ADD leanote-linux-amd64-v2.0.bin.tar.gz /root/
#ADD mongodb-linux-x86_64-ubuntu1404-3.2.0.tgz /root/

RUN mkdir -p /root/db && \
    cd /root && \
    mv mongodb-linux-x86_64-ubuntu1204-3.2.8 mongodb && \
    mkdir -p /root/conf_bak && \
    cp /root/leanote/conf/* /root/conf_bak && \
    chmod a+x /root/init.sh && \
    chmod a+x /root/leanote/bin/run.sh

EXPOSE 9000

CMD ["/usr/bin/supervisord"]
