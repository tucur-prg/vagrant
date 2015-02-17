#
# オブジェクト
#

puts "---- object ----"

i = 10
s = "5"

# p a + b # String can't be coerced into Fixnum (TypeError)
p i + s.to_i # 型変換（文字->数値） 15
p i.to_s + s # 型変換（数値->文字） "105"

h = {foo: 100, bar: 200}
p h.to_a # 型変換（ハッシュ->配列） [[:foo, 100], [:bar, 200]]

a = [[:foo, 100], [:bar, 200]]
p a.to_h # 型変換（配列->ハッシュ） {:foo=>100, :bar=>200}


