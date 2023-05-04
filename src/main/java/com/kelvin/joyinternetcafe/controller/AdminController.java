package com.kelvin.joyinternetcafe.controller;

import com.kelvin.joyinternetcafe.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;

    @RequestMapping("/login")
    public ModelAndView adminLogin(String name, String password, HttpServletRequest request) {
        // HttpSession session1 = request.getSession();
        ModelAndView mv = new ModelAndView();
        String pwd = adminService.getAdminPwd(name);
        if (password.equals(pwd)) {
            request.getSession().setAttribute("admin", name);
            mv.setViewName("forward:/overview/do");
        } else {
            mv.addObject("msg", "帐号或密码错误");
            mv.setViewName("forward:/index.jsp");
        }
        return mv;
    }

    @RequestMapping("/logout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("admin");
        return "forward:/";
    }
}
