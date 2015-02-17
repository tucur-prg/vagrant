#
# 変数、定数、演算
#

### 変数
# a-z で始まる値
puts "---- 変数 ----"

email = "hoge@example.com"

p email

### 定数
# A-Z で始まる値（通例としてすべて大文字で書くことが多い）
puts "---- 定数 ----"

EMAIL = "fuga@example.com"

p EMAIL

### 多重代入
puts "---- 多重代入 ----"

a, b = 'OK', 'NG'
puts a
puts b

### 数値オブジェクト Numeric
puts "---- Numeric ----"

x = 10
y = 20.5
z = 1/3r # Rational(1,3)

# + - * / % **
p x % 3
p x ** 3
p z * 2

x += 5 # 自己代入
p x

# 数値メソッド
p y.round

### 文字列オブジェクト String
puts "---- String ----"

name = "hoge"

puts "hello #{name}" # 変数展開、特殊文字 (\n, \t)
puts 'hello #{name}' 

# 文字列結合
puts 'hello ' + name

# 繰り返し
puts 'hello' * 5


### %記法
# () {} !! などで囲める
# "や'をエスケープせずに利用できる
puts "---- %記法 ----"

# %Q ダブルクォート
s = %Q(hello\tworld)
p s

# %Q は省略可
s = %(hello\tworld)
p s

# %q シングルクォート
s = %q(hello\tworld)
p s

# %W 配列 ダブルクォート
a = %W(a b c)
p a

# %w 配列 シングルクォート
a = %w(a b c)
p a
