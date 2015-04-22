//
// クラス、継承、アクセス修飾子
//
public class Class {
    public static void main(String[] args) {
        System.out.println("---- class ----");

        Foo obj1 = new Foo("abc");
        System.out.println(obj1.call());

        System.out.println("---- extends ----");

        Bar obj2 = new Bar("123");
        System.out.println(obj2.call());
    }
}

// クラス宣言
class Foo {
    // メンバー変数

    // 外からもアクセス可能
    public String hoge;

    // 継承先までアクセス可能
    protected String fuga = "protected";

    // 他でアクセス不可
    private String secret = "private";

    // コンストラクタ
    Foo(String hoge) {
        this.hoge = hoge;
    }

    public String call() {
        this.show1();
        this.show2();
        return "hoge " + this.hoge;
    }

    protected void show1() {
        System.out.println("protected");
    }

    private void show2() {
        System.out.println("private");
    }
}

// 継承
class Bar extends Foo {
    Bar(String name) {
        // 親クラスを呼び出す
        super(name);
    }

    // オーバーライド
    public String call() {
        this.show1();
        return "override " + this.hoge;
    }
}
