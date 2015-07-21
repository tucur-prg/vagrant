# coding: UTF-8

#
# 事前準備
# yum -y install python-devel.x86_64 libcouchbase2-libevent libcouchbase-devel
# pip install couchbase
#

# setup時にbeer-sampleを登録しておく

from couchbase.bucket import Bucket
from couchbase.exceptions import CouchbaseError

c = Bucket('couchbase://localhost/beer-sample')

try:
    beer = c.get("aass_brewery-juleol")

except CouchbaseError as e:
    print "Couldn't retrieve value for key", e
    raise

doc = beer.value

print unicode("{name}, ABV: {abv}").format(name=doc['name'], abv=doc['abv'])

doc['comment'] = "Random Beer from Norway"

try:
    result = c.replace("aass_brewery-juleol", doc)
    print result

except CouchbaseError as e:
    print "Couldn't replace key"
    raise
