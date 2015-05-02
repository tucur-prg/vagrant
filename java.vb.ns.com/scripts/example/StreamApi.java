//
// Stream API
//
import java.util.stream.IntStream;

public class StreamApi {
    public static void main(String[] args) {
        System.out.println("---- Stream API ----");

        /*
        Stream APIには４つのインターフェースがあります

        Stream<T>    : 参照型のデータ列
        IntStream    : プリミティブ型(int)のデータ列
        LongStream   : プリミティブ型(long)のデータ列
        DoubleStream : プリミティブ型(double)のデータ列

        プリミティブ型はラッパークラス（Stream<Integer>）を利用することもできるが、
        オートボクシングが頻発してパフォーマンスが落ちるので使わないほうがよい。

        Stream APIの処理の流れは
        1.すt−リームを生成
        2.中間操作を繰り返し（フィルタリング、変換、ソートなど）
        3.終端操作を行う

        Stream APIでは並列実行を行うことができますが、
        実装する場合は注意が必要です。
        ・操作中にデータソースを変更しない
        ・副作用がない（ステートレス）
        ・操作が結合法則を満たす
        を守る必要があります。
        また逐次実行との処理速度の比較を行っておかないと場合によっては並列実行のほうが動作が遅いことがあります。
        */

        System.out.println("---- IntStream ----");

        IntStream
            .rangeClosed(1, 10) // 1 - 10 のIntStream
            .filter(n -> n % 2 == 0) // 偶数フィルター
            .forEach(System.out::println);
    }
}
