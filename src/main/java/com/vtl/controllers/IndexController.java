/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import com.vtl.service.CompanyService;
import com.vtl.service.MajorService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
public class IndexController {

    @Autowired
    private CompanyService companyservice;
    @Autowired
    private MajorService majorservice;

    @GetMapping("/")
    public String index(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("companies", this.companyservice.getListCompany(page));
        model.addAttribute("listMajor", this.majorservice.getListMajor());
        model.addAttribute("counter", this.companyservice.countCompany());

        return "index";
    }

    @ModelAttribute
    public void jobnavBar(Model model) {
        //static heder
        model.addAttribute("ListcHeader", this.companyservice.getListCompany());
        //
        model.addAttribute("majorAuto", this.majorservice.getListMajor());
    }

    @GetMapping("/{city}")
    public String index1(Model model, @PathVariable(value = "city") String city,
             @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("companies", this.companyservice.getListCompanyByCity(city));
        model.addAttribute("listMajor", this.majorservice.getListMajor());
        model.addAttribute("counter1", this.companyservice.countCompany());
        return "index";
    }

    @GetMapping("/{company}/{2}/{3}")
    public String index1(Model model, @PathVariable(value = "company") String company
            ,@PathVariable(value = "2") String a
            ,@PathVariable(value = "3") String b) {

        model.addAttribute("companies", this.companyservice.getListCompanyByCompany(company));
        model.addAttribute("listMajor", this.majorservice.getListMajor());
        model.addAttribute("counter2", this.companyservice.countCompany());
        return "index";
    }

    @GetMapping("/{company}/{city}")
    public String index1(Model model, @PathVariable(value = "company") String company,
            @PathVariable(value = "city") String city,
             @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("companies", this.companyservice.getListCompanyBycityAndCompany(company, city));
        model.addAttribute("listMajor", this.majorservice.getListMajor());
        model.addAttribute("counter3", this.companyservice.countCompany());
        return "index";
    }

    @PostMapping("/")
    public String indexView(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("companies", this.companyservice.getListCompany(page));
        return "index";
    }

    @RequestMapping(value = {"/", "/index"})
    public String staticResource(Model model) {
        return "index";
    }
}
