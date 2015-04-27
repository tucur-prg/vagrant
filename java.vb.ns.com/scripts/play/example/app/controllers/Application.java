package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import views.html.*;

import java.lang.reflect.Method;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Your new application is ready."));
    }

    public static Result rest() {
        DynamicForm form = new DynamicForm().bindFromRequest();

        String action = form.get("act");

        try {
            // 動的メソッドの呼び出しによる forward サンプル
            Class c = Class.forName("controllers.Forward");
            Method m = c.getMethod(action);
            Logger.info("call forward " + action);
            return (Result) m.invoke(null, null);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Logger.info("call not forward");
        return ok("3" + action);
    }
}
