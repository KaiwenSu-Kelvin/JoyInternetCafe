package com.kelvin.joyinternetcafe.controller;


import com.kelvin.joyinternetcafe.domain.UsageRecord;
import com.kelvin.joyinternetcafe.service.IUsageRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/revenue")
public class RevenueController {
    @Autowired
    private IUsageRecordService usageRecordService;

    @RequestMapping("/show-page")
    public String revenueShowPage() {
        return "revenue";
    }

    @RequestMapping("/search")
    public ModelAndView searchByDate(String date){
        System.out.println(date);
        ModelAndView mv = new ModelAndView();
        List<UsageRecord> usages = usageRecordService.getUsageByDate(date);
        Integer income = usageRecordService.getIncomeByDate(date);
        int[] userInHour = usageRecordService.CountRevenueRecord(date);
        mv.addObject("usages",usages);
        mv.addObject("income",income);
        mv.addObject("date",date);
        mv.addObject("userInHour",userInHour);
        mv.setViewName("revenue");
        return mv;
    }

}
