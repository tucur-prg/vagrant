#
# 条件分岐
#

=begin
true:  それ以外 (0 '' を含む)
false: false nil
=end

### if
puts "---- if ----"

i = 90

if i > 60
    puts "Hard"
elsif i > 40 && i < 60
    puts "Normal"
else
    puts "Easy"
end

# 省略系
puts "OK" if i > 60

# 三項演算子
puts i > 60 ? 'OK' : 'NG'

### case
puts "---- case ----"

color = "blue"

case color
when "blue", "green"
    puts "100"
when "red"
    puts "200"
when "yellow"
    puts "300"
else
    puts "0"
end
