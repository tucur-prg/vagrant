# coding: UTF-8
#
# クラス、継承
#

### クラス
print "---- クラス ----"

class Foo(object):
    # コンストラクタ
    def __init__(self, int):
        # インスタンス生成時に実行される
        self.int = int

    def double(self):
        return self.int * self.int


obj1 = Foo(100)
obj2 = Foo(30)

print obj1.int
print obj1.double()
print obj2.double()

### 継承
print "---- 継承 ----"

class Bar(Foo):
    def plus(self, int):
        return self.int + int

obj3 = Bar(80)

print obj3.double()
print obj3.plus(20)
