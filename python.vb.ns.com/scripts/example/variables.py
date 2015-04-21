# coding: UTF-8
#
# 変数、遠山
#

### 変数
# 変数名の大文字小文字は区別されるので注意
print "---- 変数 ----"

msg = "foobar"
print msg

### 数値
print "---- 数値 ----"

print 10 * 5

print 10 // 3 # 商
print 10 % 3 # あまり
print 2 ** 3 # 冪乗

# 整数と小数を演算すると小数として出力される
print 5 + 2.0

# 整数同士の割り算は切り捨て整数になる
print 10 / 3
print 10 / 3.0

### 文字列
print "---- 文字列 ----"

# マルチバイトを利用する場合は頭に u をつける
msg = u"マルチバイト"
print msg

# 連結
print "hello " + "world"

# 繰り返す
print "fuga" * 5

# 複数行の文字列
print """<html lang="ja">
<body>
</body>
</html>"""

## 文字列関数
print "---- 文字列関数 ----"
str = "abcdefghi"

print len(str)
print str.find("c") # 見つからない場合は -1

print str[2]
print str[2:5]
print str[2:]
print str[2:-2]
print str[:2]

# 分解
print "2015/01/23".split("/")

# 文字列にデータを組み込む
print "int: %d" % 10
print "int: %04d" % 3
print "float: %f" % 12.32
print "float: %.3f" % 12.32
print "str: %s" % "ok"

h = {"foo": 100, "bar": 200}
print "辞書: %(foo)d" % h
