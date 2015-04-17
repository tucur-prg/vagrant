#
# 例外処理
#

def foo(type)
  case type
  when 'runtime'
    raise "runtime"
  when 'argument'
    raise ArgumentError, "invalid argument"
  else
    puts "call"
  end

  puts "ok"
rescue => e
  p e.message
  puts "rescue"
else
  puts "else"
ensure
  puts "ensure"
end

# 例外をキャッッチする
puts "---- exception ----"

begin
  puts "例外を監視（try）"

  raise "Runtime Error Message"

  puts "到達しない"
rescue => e
  p e.message
  puts "例外時に通る（catch）"
  # retry
else
  puts "例外が発生しなかった場合に通る"
ensure
  puts "必ず通る（finally）"
end

puts "---- method exception ----"

foo "call"
foo "runtime"
foo "argument"

puts "---- rescue修飾子 ----"

0 / 0 rescue p "error"
