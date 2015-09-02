
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
$ wget http://central.maven.org/maven2/com/couchbase/client/couchbase-client/1.4.10/couchbase-client-1.4.10.jar
$ wget http://central.maven.org/maven2/net/spy/spymemcached/2.11.4/spymemcached-2.11.4.jar
$ wget http://central.maven.org/maven2/org/codehaus/jettison/jettison/1.1/jettison-1.1.jar
$ wget http://central.maven.org/maven2/org/jboss/netty/netty/3.2.0.Final/netty-3.2.0.Final.jar
$ wget http://central.maven.org/maven2/commons-codec/commons-codec/1.5/commons-codec-1.5.jar
$ wget http://central.maven.org/maven2/org/apache/httpcomponents/httpcore/4.3/httpcore-4.3.jar
$ wget http://central.maven.org/maven2/org/apache/httpcomponents/httpcore-nio/4.3.2/httpcore-nio-4.3.2.jar
```

**コンパイル**
```
$ javac -cp couchbase-client-1.4.10.jar:spymemcached-2.11.4.jar Send.java
```

**実行**
```
$ java -cp .:couchbase-client-1.4.10.jar:spymemcached-2.11.4.jar:jettison-1.1.jar:netty-3.2.0.Final.jar:commons-codec-1.5.jar:httpcore-4.3.jar:httpcore-nio-4.3.2.jar Send
```
