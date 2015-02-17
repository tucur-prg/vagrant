#
# メソッド
#

### ! 破壊的メソッド
# 元の値を上書きする
puts "---- 破壊的メソッド ----"

s = "hello"

puts s.upcase  # HELLO
puts s         # hello

puts s.upcase! # HELLO
puts s         # HELLO

### ? 真偽値を返すメソッド
puts "---- 真偽値メソッド ----"

s = ""
p s.empty? # true

s = "hello"
p s.empty? # false

### 関数的メソッド
puts "---- 関数的メソッド ----"

def myfunc(name = "hoge")
    s = "hello " + name
    return s
end

puts myfunc("foo")
puts myfunc("bar")
puts myfunc()

