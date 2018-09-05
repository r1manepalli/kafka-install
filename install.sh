#!/bin/sh
# This is a script to help with installing and setting up kafka

# YOU CAN MODIFY THIS URL FOR A SPECIFIC VERSION (https://kafka.apache.org/downloads)
KAFKA_URL="http://mirror.cc.columbia.edu/pub/software/apache/kafka/2.0.0/kafka_2.11-2.0.0.tgz"

KAFKA_FILE=$(basename "$KAFKA_URL" ".tgz")
getent group somegroupname || groupadd somegroupname
id -u kafka &>/dev/null || useradd kafka
id -u zookeeper &>/dev/null || useradd zookeeper
usermod -a -G kafka kafka
usermod -a -G kafka zookeeper
cp -rp *.service /etc/systemd/system/
cd /tmp
wget $KAFKA_URL
tar -xzf $KAFKA_FILE.tgz
mkdir -p /opt/kafka
cp -rp $KAFKA_FILE/* /opt/kafka
mkdir -p /tmp/zookeeper
mkdir -p /var/log/kafka
mkdir -p /var/log/zookeeper
mkdir -p /etc/kafka
mkdir -p /etc/zookeeper
mkdir -p /zookeeper
chown -R zookeeper:kafka /zookeeper
mkdir -p /kafka
chown -R kafka:kafka /kafka
cp $KAFKA_FILE/config/server.properties /etc/kafka/
cp $KAFKA_FILE/config/zookeeper.properties /etc/zookeeper/
rm -rf $KAFKA_FILE
rm $KAFKA_FILE.tgz
chgrp -R kafka /opt/kafka
chown -R kafka:kafka /etc/kafka
chown -R zookeeper:kafka /etc/zookeeper
chown -R kafka:kafka /var/log/kafka
chown -R zookeeper:kafka /var/log/zookeeper
chown -R zookeeper:kafka /tmp/zookeeper
echo "Installation Complete"

