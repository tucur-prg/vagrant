#!/usr/bin/env python
import pika
import time

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')

num = 0
while num < 100000:
    channel.basic_publish(exchange='',
                          routing_key='hello',
                          body='Hello World! ' + str(num))
    print " [x] Sent 'Hello World!' " + str(num)
    num += 1
#    time.sleep(0.001)

connection.close()
