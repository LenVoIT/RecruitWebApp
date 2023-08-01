/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.Comment;
import com.vtl.service.CommentService;
import com.vtl.service.CurriculumVitaeService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("/api")
public class ApiApplyCvController {
    @Autowired
    private CurriculumVitaeService curriculumVitaeService;
    @PostMapping(path = "/job-detail/apply", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<CandidateJob> apply(@RequestBody Map<String, String> params){
        try{
            int jobID = Integer.parseInt(params.get("jobID"));
            int candidateID = Integer.parseInt(params.get("candidateID"));
            int cvID = Integer.parseInt(params.get("cvID"));
            CandidateJob c = this.curriculumVitaeService.applyCV(jobID, candidateID, cvID);
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    @PostMapping(path = "/candidate/manage/delete", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public void deleteCV(@RequestBody Map<String, String> params){
        try{
            int cvID = Integer.parseInt(params.get("cvID"));
            this.curriculumVitaeService.deleteCV(cvID);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
