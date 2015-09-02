
# Couchbase テストクライアント

## Python

**パッケージのインストール**
```
$ yum -y install python-devel.x86_64 libcouchbase2-libevent libcouchbase-devel
$ pip install couchbase
```

**実行**
```
$ python insert.py
```

## Java

**関連ファイルのダウンロード**
```
$ wget http://central.maven.org/maven2/com/couchbase/client/java-client/2.1.4/java-client-2.1.4.jar
$ wget http://central.maven.org/maven2/com/couchbase/client/core-io/1.1.4/core-io-1.1.4.jar
$ wget http://central.maven.org/maven2/io/reactivex/rxjava/1.0.2/rxjava-1.0.2.jar
```

**コンパイル**
```
$ javac -cp java-client-2.1.4.jar:core-io-1.1.4.jar Conn.java
```

**実行**
```
$ java -cp .:java-client-2.1.4.jar:core-io-1.1.4.jar:rxjava-1.0.2.jar
```
