package com.hello.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class HelloWorldService {
  private static final Logger logger = LoggerFactory.getLogger(HelloWorldService.class);

  /**
   * 詳細文を取得する。
   *
   * @return 詳細文
   */
  public String getDesc() {
    logger.debug("getDesc() is executed!");

    return "Gradle + Spring MVC HelloWorld Example";
  }

  /**
   * タイトルを取得する。
   *
   * @param name 名前
   * @return タイトル
   */
  public String getTitle(String name) {
    logger.debug("getTitle() is executed! $name : {}", name);

    if (StringUtils.isEmpty(name)) {
      return "Hello World!";
    } else {
      return "Hello " + name;
    }
  }
}
