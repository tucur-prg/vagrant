package com.example.spring4.hello;

import org.springframework.stereotype.Component;

@Component
public class HelloServiceImpl implements HelloService {
    public String getMessage() {
        return "Hello World!!";
    }
}
