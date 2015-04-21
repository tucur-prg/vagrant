# coding: UTF-8
#
# 辞書
#

### 辞書
print "---- 辞書 ----"

h = {"yamada": 300, "tanaka": 100, "okada": 80}

print h
print h["yamada"]

h["okada"] = 200

print h

# 存在チェック
print "tanaka" in h

# キーのリストを取得
print h.keys()

# 値のリストを取得
print h.values()

# キーと値のタプルのリストを取得
print h.items()
