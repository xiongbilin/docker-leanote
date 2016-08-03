#!/bin/bash
#set -m

# 如果数据库未初始化，则初始化数据库
if [ ! -f "/root/db/already-init-db" ] ; then
    touch /root/db/already-init-db
    /root/mongodb/bin/mongorestore -h localhost -d leanote --dir /root/leanote/mongodb_backup/leanote_install_data/
fi

# 如果配置文件不存在，则复制配置文件
if [ ! -f "/root/leanote/conf/app.conf" ] ; then
    cp /root/conf_bak/* /root/leanote/conf/
fi
