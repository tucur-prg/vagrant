# coding: UTF-8
#
# モジュールを利用する
#

print "---- import ----"

# モジュールを読み込む
import math, random
# 部分的に読み込む
from datetime import date

print math.ceil(5.2)

for i in range(5):
    print random.random()

print date.today()
