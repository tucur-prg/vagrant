#
# 連想配列（ハッシュ）
#

puts "---- hash ----"

h = {"foo" => 100, "bar" => 200}
p h["foo"] # 100

# シンボルオブジェクト
h = {:foo => 101, :bar => 201}
p h[:foo] # 101

h = {foo: 102, bar: 202} # ver 1.9 ～ 利用可能な記述方法
p h[:foo] # 102

# ハッシュメソッド
p h.size           # 要素数
p h.keys           # キーの一覧
p h.values         # 値の一覧
p h.has_key?(:foo) # キーの存在確認
