package com.kelvin.joyinternetcafe.controller;

import com.kelvin.joyinternetcafe.service.IUsageRecordService;
import com.kelvin.joyinternetcafe.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/overview")
public class OverviewController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IUsageRecordService usageRecordService;


    @RequestMapping("/do")
    public ModelAndView countOnlineUser() {
        ModelAndView mv = new ModelAndView();
        int[] count = userService.countOnlineUser();
        int[] countByHour = usageRecordService.CountUserAtLatestHour();

        mv.addObject("count",count);
        mv.addObject("countByHour",countByHour);
        mv.setViewName("overview");
        return mv;
    }
}
