package com.kelvin.joyinternetcafe.controller;

import com.kelvin.joyinternetcafe.exception.ResourceNotFoundException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test/error")
public class ErrorTestController {
    @RequestMapping("/e1")
    public String e1() {
        int num = 10/0;
        return "Hello Index";
    }

    @RequestMapping("/e2")
    public String e2() {
        Object obj = null;
        System.out.println(obj.hashCode());
        return "Hello Index";
    }


    @RequestMapping("/e3")
    public String e3() {
        throw new ResourceNotFoundException(null);
    }

}
