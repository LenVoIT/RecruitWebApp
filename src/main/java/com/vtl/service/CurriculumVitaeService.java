/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtl.service;

import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.CurriculumVitae;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CurriculumVitaeService {
    boolean addCV(CurriculumVitae cv);
//    boolean updateCV(CurriculumVitae cv);
    List<CurriculumVitae> getListCvForManage(int candidateID);
    boolean applyCV(CandidateJob cj);
    CandidateJob applyCV(int jobID, int candidateID, int cvID);
    CandidateJob getApply(int jobID, int candidateID);
    void deleteCV(int cvID);
}
