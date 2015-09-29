package com.example.spring4.hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HelloWorldPrinter {
    @Autowired
    private HelloService helloService;

    public void run() {
        System.out.println(helloService.getMessage());
    }
}
