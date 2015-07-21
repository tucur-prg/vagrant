# coding: UTF-8

from couchbase.bucket import Bucket
from couchbase.exceptions import CouchbaseError

c = Bucket('couchbase://localhost/beer-sample')

try:
    for row in c.query('beer', 'brewery_beers', limit=3):
        print row.key

        result = c.get(row.key[0])
        print result.value


except CouchbaseError as e:
    print e
    raise
