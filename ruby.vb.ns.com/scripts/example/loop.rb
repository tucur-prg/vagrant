#
# 繰り返し処理
#

=begin
break: ループを抜ける
next:  ループを一回スキップ
=end

### times
puts "---- times ----"

5.times do |i|
   if  i == 1
       next
   end

   puts "#{i}: hello"
end

### while
puts "---- while ----"

i = 0

# 真の間は繰り返す
while i < 5 do
   if  i == 2
       break
   end

   puts "#{i}: hello"
   i += 1
end

### until
puts "---- until ----"

i = 0

# 偽の間は繰り返す
until i > 5 do
  puts "#{i}: hello"
  i += 1
end

### for
puts "---- for ----"

for i in 0..2 do
   puts "#{i}: hello"
end

for color in ["red", "blue", "green"] do
    puts color
end

### each
puts "---- each ----"

["red", "blue", "green"].each do |color|
    puts color
end

{foo: 200, bar: 300, hoge:100, fuga:400}.each do |key, val|
    puts "#{key} => #{val}"
end
