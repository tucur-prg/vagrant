# coding: UTF-8

from couchbase.bucket import Bucket
from couchbase.exceptions import CouchbaseError

c = Bucket('couchbase://localhost/default')

try:
    for i in range(100):
        c.upsert('number' + str(i), { 'num': i, 'group': i % 3, 'name': 'hoge' })

    c.upsert('hoge', { 'some': 'value', 'some2': 'value2' })

    rv = c.get('hoge')

    print rv.value

    rv.value['comment'] = 'ok'
    c.replace('hoge', rv.value)

    rv = c.get('hoge')

    print rv.value

except CouchbaseError as e:
    print e
    raise
