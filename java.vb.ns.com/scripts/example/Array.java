//
// 配列
//
public class Array {
    public static void main(String[] args) {
        System.out.println("---- array ----");

        // [] をつけることで配列であることを宣言
        int arr[] = new int[4]; // 領域の確保

        System.out.println(arr.length);

        arr[0] = 100;
        arr[1] = 200;
        arr[2] = 400;
        arr[3] = 50;

        // 直接代入
        int foo[] = {10, 20, 50, 30, 8};

        System.out.println(foo.length);
    }
}
