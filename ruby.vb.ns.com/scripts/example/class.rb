#
# クラス
#

puts "---- class ----"

# 大文字で始まる
class User
    # クラス変数: クラス内で永続する値
    @@count = 0

    # コンストラクタ
    def initialize(name)
        # インスタンス変数: インスタンス内で使いまわせる値
        @name = name

        @@count += 1
    end

    # インスタンスメソッド: インスタンスを作成すると呼び出せるメソッド
    def hello
        puts "hello, my name is #{@name}"
    end

    # クラスメソッド: 静的に呼び出せるメソッド
    def User.count
        puts "create User class (#{@@count})"
    end
end

User.count()

foo = User.new("foo")
foo.hello()

bar = User.new("bar")
bar.hello()

User.count()

### 継承
puts "---- inherit ----"

class SuperUser < User
    def bye
        puts "goodbye #{@name}"
    end
end

hoge = SuperUser.new("hoge")
hoge.hello()
hoge.bye()

### アクセサ
puts "---- accessor ----"

class AdminUser < User
    attr_accessor :name # getter + setter
    #attr_reader :name # getter
    #attr_writer :name # setter
end

fuga = AdminUser.new("fuga")
puts fuga.name

fuga.name = 'none'
fuga.hello()
