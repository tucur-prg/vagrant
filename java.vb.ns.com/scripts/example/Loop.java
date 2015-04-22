//
// 繰り返し
//
public class Loop {
    public static void main(String[] args) {
        System.out.println("---- loop ----");

        //// while
        System.out.println("---- while ----");

        int i = 0;
        while (i < 10) {
            i++;
            if (i == 3) {
                continue;
            } else if (i == 8) {
                break;
            }

            System.out.println(i);
        }

        i = 20;
        // 後判定
        do {
            i++;
            System.out.println(i);
        } while (i < 10);

        //// for
        System.out.println("---- for ----");

        for (i = 0; i < 10; i++) {
            System.out.println(i);
        }
    }
}
