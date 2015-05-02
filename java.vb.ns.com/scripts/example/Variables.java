//
// 変数
//
public class Variables {
    public static void main(String[] args) {
        System.out.println("---- 変数 ----");

        // 大文字小文字は区別される、英数字$_が利用可能
        boolean flag = true;

        System.out.println(flag);

        //// 数値
        // byte / short / int / long
        // longとして値を入れる場合は末尾に l / L をつけて上げる必要がある
        int i = 10;
        long l = 20L;

        System.out.println(i);
        System.out.println(l);
        System.out.println(i / 3); // 切り捨てになります
        System.out.println(i % 3);

        // float / double
        // floatとして値を入れる場合は末尾に f / F をつけて上げる必要がある
        float f = 10.1f;
        double d = 20.2;

        System.out.println(f);
        System.out.println(d);
        System.out.println(f / 3.0);

        //// 文字
        // charはシングルクォートで囲む
        char c = 'A';

        System.out.println(c);

        // 文字列はダブルクォートで囲む
        String s = "abcdefg";

        System.out.println(s);
        System.out.println(s + "hijklmn");

        // 文字列を比較するときは比較演算子では比較できません。
        // trueが返ってくる場合がありますが、それはStringクラスの参照先が同じポインタを見ている為です。
        // ポインタが違うものを指した段階でfalseになります。
        String s2 = "abcdef";
        s2 += "g";

        System.out.println(s == s2);
        System.out.println(s.equals(s2));

        // 利用可能なメソッド
        System.out.println(s.substring(2, 5));
        System.out.println(s.replaceAll("abc", "ABC"));

        String[] week = "Sun,Mon,Tue".split(",");

        System.out.println(week[0]);
        System.out.println(week[1]);
        System.out.println(week[2]);
    }
}
