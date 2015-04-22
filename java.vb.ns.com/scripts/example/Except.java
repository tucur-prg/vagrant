//
// 例外
//
import java.lang.Exception;

public class Except {
    public static void main(String[] args) {
        System.out.println("---- exception ----");

        try {
            throw new Exception("test");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("例外が発生しても通る処理");
        }
    }
}
