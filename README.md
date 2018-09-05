# kafka-install
This is a very basic install for Kafka and its dependencies

## Quickstart
```
sudo ./install.sh
sudo systemctl start zookeeper
sudo systemctl start kafka
```

## Setup
You will want to modify the following config files.
  * /etc/kafka/server.properties
    ```
    broker.id=[broker number here]
    log.dirs=/var/log/kafka
    ```
