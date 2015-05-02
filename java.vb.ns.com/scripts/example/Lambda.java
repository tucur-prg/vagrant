//
// ラムダ式、メソッド参照、コンストラクタ参照
//
import java.util.List;
import java.util.Arrays;

public class Lambda {
    public static void main(String[] args) {
        System.out.println("---- Lambda ----");

        List<String> strs = Arrays.asList("foo", "bar", "hoge", "fuga");

        // (引数) -> {処理}
        strs.forEach((String s) -> {
            System.out.println(s);
        });

        // 省略して記載することも可能

        // 引数の型を省略するとコンパイル時に型を自動で判別してくれる
        strs.forEach((s) -> {
            System.out.println(s);
        });

        // 要素が１つなら()や{}も省略可能
        strs.forEach(s -> System.out.println(s));

        System.out.println("---- メソッド参照 ----");

        // クラス名::メソッド名　もしくは　インスタンス名：：メソッド名
        strs.forEach(System.out::println);

        System.out.prontln("---- コンストラクタ参照 ----");

        // クラス名::new
    }
}
