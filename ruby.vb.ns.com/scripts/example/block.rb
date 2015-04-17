#
# ブロック
#

puts "---- block ----"

def foo
  # ブロックが引数で渡されているかどうか
  p block_given?

  # ブロックを呼び出す
  # def foo (&proc)
  #     proc.call 100
  # と同じ
  yield 100
end


foo do |i|
  puts i * 20
end

# 省略
foo {|i| puts i * 10}
