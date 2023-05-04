package com.kelvin.joyinternetcafe.controller;

import com.kelvin.joyinternetcafe.domain.User;
import com.kelvin.joyinternetcafe.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private IUserService userService;



    @RequestMapping("/go")
    public String jump() {
        return "register";
    }

    @RequestMapping("/do")
    public ModelAndView register(User user, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User registered = userService.isRegistered(user.getIdentityNumber());
        if (registered != null) {
            mv.addObject("msg","该身份已存在");
            System.out.println("该身份已存在");
        } else {
            System.out.println("该身份不存在，正在注册");
            //session.setAttribute("user",user);
            userService.userRegister(user);
            mv.addObject("msg","注册成功");
        }
        mv.setViewName("forward:/register/go");
        return mv;
    }
}
