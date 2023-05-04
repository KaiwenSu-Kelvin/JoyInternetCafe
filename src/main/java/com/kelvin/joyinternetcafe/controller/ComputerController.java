package com.kelvin.joyinternetcafe.controller;


import com.kelvin.joyinternetcafe.domain.Computer;
import com.kelvin.joyinternetcafe.domain.Section;
import com.kelvin.joyinternetcafe.service.IComputerService;
import com.kelvin.joyinternetcafe.service.ISectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/computer")
public class ComputerController {
    @Autowired
    private IComputerService computerService;
    @Autowired
    private ISectionService sectionService;

    @RequestMapping("/all")
    public ModelAndView getAll() {
        ModelAndView mv = new ModelAndView();

        List<Computer> computers = computerService.getAllComputer();
        mv.addObject("computers",computers);
        mv.setViewName("computerShow");
        return mv;
    }

    @RequestMapping("/addPage")
    public ModelAndView toAddPage() {
        ModelAndView mv = new ModelAndView();
        List<Section> sections = sectionService.getAllSection();
        mv.setViewName("addDevice");
        mv.addObject("sections",sections);
        return mv;
    }

    @RequestMapping("/add")
    public String addOne(Computer computer,int sectionId) {
        computerService.addComputer(computer,sectionId);
        return "forward:/computer/all";
    }

    @RequestMapping("/updateStatus")
    public String updateStatus(int id,int status) {
        computerService.changeComputerStatus(id, status);
        return "forward:/computer/all";
    }
}
