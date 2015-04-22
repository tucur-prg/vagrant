//
// 関数
//
public class Method {
    public static void main(String[] args) {
        System.out.println("---- method ----");

        foo("bar");
        foo();
    }

    public static void foo(String val) {
        System.out.println("foo" + val);
    }

    // オーバーロード
    public static void foo() {
        System.out.println("foo overload");
    }
}
