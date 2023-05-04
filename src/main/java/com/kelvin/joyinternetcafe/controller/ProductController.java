package com.kelvin.joyinternetcafe.controller;


import com.kelvin.joyinternetcafe.domain.JsonFormat;
import com.kelvin.joyinternetcafe.domain.Product;
import com.kelvin.joyinternetcafe.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    @RequestMapping("/all")
    public ModelAndView allProduct() {
        ModelAndView mv = new ModelAndView();
        List<Product> allProduct = productService.getAllProduct();
        mv.addObject("allProduct",allProduct);
        mv.setViewName("product");
        return mv;
    }

    @RequestMapping("/modify")
    public ModelAndView modifyProduct(Product product) {
        productService.modifyProduct(product);

        ModelAndView mv = new ModelAndView();
        mv.addObject("product",product);
        mv.setViewName("forward:/product/all");

        return mv;
    }

    @RequestMapping("/new")
    public ModelAndView addNewProduct(Product product) {
        productService.addNewProduct(product);

        ModelAndView mv = new ModelAndView();
        mv.addObject("product",product);
        mv.setViewName("forward:/product/all");

        return mv;
    }

    @ResponseBody
    @RequestMapping("/pic")
    public JsonFormat uploadPicture(MultipartFile file, HttpSession session) throws IOException {

        File path = new File(session.getServletContext().getRealPath("upload/product"));
        System.out.println(path);
        if (!path.exists()) {
            path.mkdir();
        }

        if (!file.isEmpty()) {
            String fileName =  file.getOriginalFilename();
            file.transferTo(new File(path,fileName));
        }

        JsonFormat json = new JsonFormat();
        String fileName =  file.getOriginalFilename();
        json.setData(fileName);
        return json;
    }
}
