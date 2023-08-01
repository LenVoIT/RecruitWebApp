/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import com.vtl.pojo.CurriculumVitae;
import com.vtl.pojo.Job;
import com.vtl.pojo.User;
import com.vtl.service.CandidateService;
import com.vtl.service.CurriculumVitaeService;
import com.vtl.service.UserService;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Admin
 */
@Controller
public class CurriculumVitaeController {


    @Autowired
    private CurriculumVitaeService curriculumVitaeService;
    @Autowired
    private UserService userDetailService;

    @GetMapping("/candidate/create-cv")
    public String creatCvView(Model model, Principal principal) { //mới thêm chữ e trong creatCvView
        if(principal == null){
            return "login";
        }
        User u = this.userDetailService.getUserByUsername(principal.getName()).get(0);
        model.addAttribute("candidate", u.getCandidate());
        model.addAttribute("cv", new CurriculumVitae());
        return "createCV";
    }

    @PostMapping("/candidate/create-cv")
    public String creatCv(Model model, @ModelAttribute(value = "cv") @Valid CurriculumVitae cv, //mới thêm chữ e
            BindingResult r) {
        if (r.hasErrors()) {
            return "createCV";
        }
        if (curriculumVitaeService.addCV(cv) ==true) {
            return ("index");
        }
        return "createCV";
    }

}
