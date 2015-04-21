# coding: UTF-8
#
# 繰り返し
#

### for
# 繰り返す範囲はインデントの高さが揃ってる部分
print "---- for ----"

arr = [10, 40, 20, 80, 100]

sum = 0
for val in arr:
    sum += val
else:
    # 繰り返しが終わった後に一度処理する
    print sum

# 指定回数繰り返ししたい
for i in range(10):
    if i == 3:
        continue
    elif i == 8:
        break

    print i

# 辞書の繰り返し処理
h = {"yamada": 200, "tanaka": 300, "okada": 80}

for key, val in h.iteritems():
    print "key: %s, value: %s" % (key, val)

for key in h.iterkeys():
    print key

for val in h.itervalues():
    print val

### while
print "---- while ----"

n = 0
while n < 10:
    n += 1
    if n == 3:
        continue
    elif n == 8:
        break
    print n
else:
    # break の場合は通らない
    print "end"
