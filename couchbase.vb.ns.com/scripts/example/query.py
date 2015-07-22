# coding: UTF-8

from couchbase.bucket import Bucket
from couchbase.exceptions import CouchbaseError

c = Bucket('couchbase://localhost/default')

try:
    for row in c.query('example', 'person', limit=5, skip=0, startkey=[0, 10], endkey=[0, 40], descending=False):
        print unicode("{key}: {value}").format(key=row.key, value=row.value)

except CouchbaseError as e:
    print e
    raise
