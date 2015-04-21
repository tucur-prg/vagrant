# coding: UTF-8
#
# 関数
#

### 関数
print "---- 関数 -----"

# 初期値は = * で指定できる
def sum(x, y, z = False):
    if z:
        print "ok"
    return x + y

print sum(10, 20)
print sum(30, 30, True)

# pass
def avg(arr):
    # 関数定義だけ作成する場合など何もしない処理としてpassを定義する
    pass

# 無名関数
print "---- 無名関数 ----"

print map(lambda x:x * x, [2, 5, 9])
