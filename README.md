# kafka-install
This is a very basic install for Kafka and its dependencies

## Setup
You will want to modify the following config files.
  * /etc/kafka/server.properties
    ```
    broker.id=[broker number here]
    log.dirs=/kafka
    ```
  * /etc/zookeeper/zookeeper.properties
    ```
    dataDir=/zookeeper
    ```
  * add /opt/kafka/bin to your PATH
  
## Quickstart
```
sudo ./install.sh
sudo systemctl start zookeeper
sudo systemctl start kafka

kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 5 --topic test
```
