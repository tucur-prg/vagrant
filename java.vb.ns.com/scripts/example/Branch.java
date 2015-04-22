//
// 条件分岐
//
public class Branch {
    public static void main(String[] args) {
        System.out.println("---- branch ----");

        //// if
        System.out.println("---- if ----");

        int i = 80;

        if (i > 90) {
            System.out.println("if");
        } else if (i > 40) {
            System.out.println("else if");
        } else {
            System.out.println("else");
        }

        // 三項演算子
        System.out.println(i > 50 ? "true" : "false");

        //// switch
        System.out.println("---- switch ----");

        switch (i) {
            case 1:
                System.out.println("first");
                break;
            case 2:
                System.out.println("middle");
                break;
            case 3:
            case 4:
                System.out.println("slow");
                break;
            default:
                System.out.println("none");
                break;
        }
    }
}
