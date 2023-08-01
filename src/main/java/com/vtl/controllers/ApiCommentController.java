/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.controllers;

import com.vtl.pojo.Comment;
import com.vtl.service.CommentService;
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
public class ApiCommentController {
    
    @Autowired
    private CommentService commentService;
    @PostMapping(path = "/company-detail/{companyID}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params){
        try{
            String assessment = params.getOrDefault("assessment", "");
            int companyID = Integer.parseInt(params.get("companyID"));
            int candidateID = Integer.parseInt(params.get("candidateID"));
            int rating = Integer.parseInt(params.get("rating"));
            Comment c = this.commentService.addComment(assessment, companyID, candidateID, rating);
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
