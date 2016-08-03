FROM ljl/supervisor:1.0
MAINTAINER qida

ADD init.sh /root/init.sh
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD leanote-linux-amd64-v2.0.bin.tar.gz /root/
ADD mongodb-linux-x86_64-ubuntu1404-3.2.0.tgz /root/

RUN mkdir -p /root/db && \
    cd /root && \
    mv mongodb-linux-x86_64-ubuntu1404-3.2.0 mongodb && \
    mkdir -p /root/conf_bak && \
    cp /root/leanote/conf/* /root/conf_bak && \
    chmod a+x /root/init.sh && \
    chmod a+x /root/leanote/bin/run.sh

EXPOSE 9000

CMD ["/usr/bin/supervisord"]
