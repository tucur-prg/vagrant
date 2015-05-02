//
// 例外
//
import java.lang.Exception;

import java.lang.Class;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

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

        System.out.println("---- multicatch ----");

        try {
            Class c = Class.forName("Except");
            Method m = c.getMethod("sub");
            m.invoke(null);
        } catch (ClassNotFoundException |
            NoSuchMethodException |
            InvocationTargetException |
            IllegalAccessException e) {
                e.printStackTrace();
        }

        System.out.println("---- try-with-resources ----");

        try (AutoCloseableImpl imp = new AutoCloseableImpl()) {
            System.out.println("try");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("finally");
        }
    }

}

class AutoCloseableImpl implements AutoCloseable {
    @Override
    public void close() throws Exception {
        System.out.println("close");
    }
}
