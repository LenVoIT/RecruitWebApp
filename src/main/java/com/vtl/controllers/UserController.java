/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import com.vtl.pojo.User;
import com.vtl.service.UserService;
import com.vtl.validators.WebAppValidator;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HP
 */
@Controller
public class UserController {

    @Autowired
    private UserService userDetailService;

    @Autowired
    private WebAppValidator userValidator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }

    @GetMapping("/login")
    public String Login(Model model, HttpServletRequest request, Principal principal) {
        if(principal != null){
            return "index";
        }
        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("url_prior_login", referrer);
        
        return "login";
    }

    @GetMapping("/register/candidate")
    public String registerCandidateView(Model model, Principal principal) {
        if(principal != null)
            return "index";
        model.addAttribute("user", new User());
        return "candidate_register";
    }

    @PostMapping("/register/candidate")
    public ModelAndView registerCandidate(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult r) {
        String errMsg = "";
        if (!userDetailService.getUserByUsername(user.getUsername()).isEmpty()) {
            errMsg = "Tên tài khoản đã tồn tại!";
            model.addAttribute("errMsg", errMsg);
            return new ModelAndView("candidate_register");  
        }
        if (!r.hasErrors()) {
            user.setUserRole("ROLE_USER");
            if (this.userDetailService.addUser(user) == true) {
                return new ModelAndView("redirect:candidate/info", "ID", user.getId());
            }
        }
        model.addAttribute("errMsg", errMsg);
        return new ModelAndView("candidate_register");
    }

    @GetMapping("/register/company")
    public String registerCompanyView(Model model, Principal principal) {
        if(principal != null)
            return "index";
        model.addAttribute("user", new User());
        return "company_register";
    }

    @PostMapping("/register/company")
    public ModelAndView registerCompany(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult r) {
        String errMsg = "";
        if (!userDetailService.getUserByUsername(user.getUsername()).isEmpty()) {
            errMsg = "Tên tài khoản đã tồn tại!";
            model.addAttribute("errMsg", errMsg);
            return new ModelAndView("company_register");  
        }
        if (r.hasErrors()) {
            return new ModelAndView("company_register");
        }

        if (!user.getPassword().equals(user.getRepassword())) {
            model.addAttribute("errMsg", "Mật khẩu không khớp!");
        } else {
            user.setUserRole("ROLE_COMPANY");
            if (this.userDetailService.addUser(user) == true) {
                return new ModelAndView("redirect:company/info", "ID", user.getId());
            }
        }
        return new ModelAndView("company_register");
    }
}
