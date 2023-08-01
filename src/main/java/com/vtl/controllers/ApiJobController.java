/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import com.vtl.service.JobService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
public class ApiJobController {
    @Autowired
    private JobService jobService;
    @PostMapping(path = "/company/manage/delete", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public void deleteCV(@RequestBody Map<String, String> params){
        try{
            int jobID = Integer.parseInt(params.get("jobID"));
            this.jobService.deleteJob(jobID);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}