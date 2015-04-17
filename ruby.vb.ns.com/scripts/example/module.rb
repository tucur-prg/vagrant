#
# モジュール
#

puts "---- module ----"

# 名前空間、mix-inとして利用される

# 名前空間
puts "---- namespace ----"

module Foo
  class Bar
    def hoge
      puts "fuga"
    end
  end
end

foo = Foo::Bar.new
foo.hoge

# mix-in
puts "---- mix-in ----"

module FooBar
  def self.aaa
    puts "class_method"
  end

  def bbb
    puts "method"
  end

  def call
    puts "call"
  end

  # モジュール関数として定義
  module_function :call
end

FooBar.call

puts "---- include ----"

class Sample1
  include FooBar

  def module
    # モジュールのクラスメソッドが利用できる
    FooBar.aaa
  end
end

sample = Sample1.new
sample.module
sample.bbb

puts "---- extend ----"

class Sample2
  extend FooBar
end

Sample2.bbb
