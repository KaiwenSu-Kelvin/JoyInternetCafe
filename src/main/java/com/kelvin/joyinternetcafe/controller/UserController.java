package com.kelvin.joyinternetcafe.controller;


import com.kelvin.joyinternetcafe.domain.User;
import com.kelvin.joyinternetcafe.service.IUsageRecordService;
import com.kelvin.joyinternetcafe.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private IUserService userService;
    @Autowired
    private IUsageRecordService usageRecordService;
    @Autowired

    @RequestMapping("/all")
    public ModelAndView getAllUser() {
        ModelAndView mv = new ModelAndView();
        List<User> allUser = userService.getUser(null);
        mv.addObject("allUser",allUser);
        mv.setViewName("register_demo");
        return mv;
    }

    @RequestMapping("/online")
    public ModelAndView getOnlineUser() {
        ModelAndView mv = new ModelAndView();
        List<User> onlineUsers = userService.getUser(true);
        mv.addObject("onlineUsers",onlineUsers);
        mv.setViewName("logout");
        return mv;
    }

    @RequestMapping("/logout")
    public ModelAndView userLogout(Integer uid, double pay) {
        usageRecordService.updateUsageRecordEndTime(uid);
        userService.updateForLogout(uid);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pay",pay);
        mv.addObject("msg","下机成功");
        mv.setViewName("forward:/user/online");
        return mv;
    }

    @RequestMapping("/recharge/go")
    public String rechargePage() {
        return "recharge";
    }

    @RequestMapping("/recharge/do")
    public ModelAndView userRecharge(String idNumber,Double money) {
        ModelAndView mv = new ModelAndView();
        //判断该账户是否存在
        User registered = userService.isRegistered(idNumber);
        if (registered != null) {
            userService.userRecharge(idNumber,money);
            mv.addObject("msg","充值成功");
        } else {
            mv.addObject("msg","该用户不存在");
        }

        mv.setViewName("recharge");
        return mv;
    }
}
