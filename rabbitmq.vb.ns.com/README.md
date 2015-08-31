
# RabbitMQ テストクライアント

## Python

**パッケージのインストール**
```
$ pip install pika==0.9.8
```

**実行**
```
$ python send.py
$ python recive.py
```

## Java

**関連ファイルのダウンロード**
```
$ wget http://www.rabbitmq.com/releases/rabbitmq-java-client/v3.5.4/rabbitmq-java-client-bin-3.5.4.tar.gz
$ tar zxvf rabbitmq-java-client-bin-3.5.4.tar.gz
$ cp rabbitmq-java-client-bin-3.5.4/*.jar ./
```

**コンパイル**
```
$ javac -cp rabbitmq-client.jar Send.java Recv.java
```

**実行**
```
$ java -cp .:commons-io-1.2.jar:commons-cli-1.1.jar:rabbitmq-client.jar Send
$ java -cp .:commons-io-1.2.jar:commons-cli-1.1.jar:rabbitmq-client.jar Recv
```
