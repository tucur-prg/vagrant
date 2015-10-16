package com.hello.web;

import com.hello.service.HelloWorldService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class WelcomeController {
  private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
  private final HelloWorldService helloWorldService;

  @Autowired
  public WelcomeController(HelloWorldService helloWorldService) {
    this.helloWorldService = helloWorldService;
  }

  /**
   * トップページ。
   * @param model サービスモデル
   * @return ビュー名
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String index(Map<String, Object> model) {
    logger.debug("index() is executed!");

    model.put("title", helloWorldService.getTitle(""));
    model.put("msg", helloWorldService.getDesc());

    return "index";
  }

  /**
   * ハローページ。
   *
   * @param name 名前
   * @return サービスモデル
   */
  @RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
  public ModelAndView hello(@PathVariable("name") String name) {
    logger.debug("hello() is executed! - $name {}", name);

    ModelAndView model = new ModelAndView();
    model.setViewName("index");

    model.addObject("title", helloWorldService.getTitle(name));
    model.addObject("msg", helloWorldService.getDesc());

    return model;
  }
}
