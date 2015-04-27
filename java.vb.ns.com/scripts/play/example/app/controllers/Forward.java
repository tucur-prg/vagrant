package controllers;

import play.*;
import play.mvc.*;
import play.data.*;

import views.html.*;

public class Forward extends Controller {

    public static Result foo() {
        DynamicForm form = new DynamicForm().bindFromRequest();

        return ok("1" + form.get("hoge") + form.get("fuga"));
    }

    public static Result bar() {
        DynamicForm form = new DynamicForm().bindFromRequest();

        return ok("2" + form.get("hoge"));
    }
}
