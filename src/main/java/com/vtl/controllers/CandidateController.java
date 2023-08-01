/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import com.vtl.pojo.Candidate;
import com.vtl.pojo.User;
import com.vtl.service.CandidateService;
import com.vtl.service.CurriculumVitaeService;
import com.vtl.service.JobService;
import com.vtl.service.MajorService;
import com.vtl.service.UserService;
import java.security.Principal;
import java.util.Date;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Admin
 */
@Controller
public class CandidateController {

    @Autowired
    private UserService userDetailService;
    @Autowired
    private CurriculumVitaeService cvService;
    @Autowired
    private CandidateService candidateService;
    @Autowired
    private JobService jobService;
    @Autowired
    private MajorService majorService;

    @GetMapping(value = "/register/candidate/info")
    public String registerCandidateView(Model model, @RequestParam(name = "ID") String ID, Principal principal) {
        if(principal != null)
            return "index";
        model.addAttribute("candidate", new Candidate());
        model.addAttribute("user", userDetailService.getUserByUserID(Integer.parseInt(ID)).get(0));

        return "candidate_register_info";
    }

    @PostMapping(value = "/register/candidate/info")
    public ModelAndView registerCandidate(@ModelAttribute(value = "candidate") @Valid Candidate candidate,
            BindingResult r) {
        if (r.hasErrors()) {
            return new ModelAndView("redirect:candidate/info", "ID", candidate.getUserID().getId());
        }
        if (candidateService.addCandidate(candidate) == true) {
            return new ModelAndView("login");
        }

        return new ModelAndView("redirect:candidate/info", "ID", candidate.getUserID().getId());
    }

    @GetMapping("/register/candidate/info/major")
    public String registerCandidateMajorView() {
        return "candidate_register_info_major";
    }

    @PostMapping("/register/candidate/info/major")
    public String registerCandidateMajor() {
        return "candidate_register_info_major";
    }
     @GetMapping("/candidate/update-info")
    public String registerInfoPrimaryView(Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }
        Candidate c = this.userDetailService.getUserByUsername(principal.getName()).get(0).getCandidate();
        model.addAttribute("candidate", c);
        return "info_primary";
    }
    @PostMapping("/candidate/update-info")
    public String InfoPrimaryView(@ModelAttribute(value = "candidate") @Valid Candidate candidate) {
        if (candidateService.updateCandidate(candidate) == true) {
            return "index";
        }
        return "info_primary";
    }


    @GetMapping("/candidate/manage")
    public String manageCandidateApplyView(Model model, Principal principal) {
         if (principal == null) {
            return "redirect:/login";
        }
        Candidate c = this.userDetailService.getUserByUsername(principal.getName()).get(0).getCandidate();
        model.addAttribute("listJbyCandidate", this.jobService.getListJobByCandidate(c.getId()));
        model.addAttribute("listCV", this.cvService.getListCvForManage(c.getId()));
        return "manage_candidate";
    }
    
    
    @GetMapping("/candidate-page")
    public String candidatePageView(Model model) {
        model.addAttribute("listC", this.candidateService.getListCandidate());
        model.addAttribute("listNameMajor", this.majorService.getListMajor());
        return "candidate_page";
    }
    @GetMapping("/candidate-page/{city}/{major}/{degree}")
    public String candidatePageView(Model model , @PathVariable(value = "city") String city
                                    , @PathVariable(value = "major") String major
                                    , @PathVariable(value = "degree") String degree) {
        model.addAttribute("listC", this.candidateService.getListCandidateByCityMajorDegree(city,major,degree));       
        model.addAttribute("listNameMajor", this.majorService.getListMajor());
        return "candidate_page";
    }
}
