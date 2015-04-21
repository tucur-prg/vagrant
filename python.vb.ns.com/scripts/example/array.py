# coding: UTF-8
#
# 配列
#

print "---- 配列 ----"

### リスト
print "---- リスト ----"

arr = [200, 400, 100, 500]

print arr
print len(arr)
print arr[2]

# 値の変更
arr[2] = 90
print arr[2]

# 値の確認
print 400 in arr

# ソート
arr.sort()
print arr
arr.reverse()
print arr

# 連結
arr = ["a", "b", "c"]
print ".".join(arr)

# 連続データの作成
print range(10)
print range(3, 10)
print range(3, 10, 2)

### タプル
# 要素の変更ができない配列
print "---- タプル ----"

arr = (100, 30, 80, 200)

print arr
print len(arr)
print arr * 2

# arr[2] = 10 # TypeError: 'tuple' object does not support item assignment

### セット（集合型）
# 要素の重複を許さない
print "---- セット ----"

arr1 = set([1, 2, 3, 4, 3, 1, 2]) # 3, 1, 2 は無視される
arr2 = set([3, 4, 5, 6])

print arr1

# 演算
print arr1 - arr2 # 差集合：arr1にあってarr2にないもの
print arr1 | arr2 # 和集合：両方の値すべて
print arr1 & arr2 # 積集合：重複したものを表示
print arr1 ^ arr2 # どちらかにしかない
