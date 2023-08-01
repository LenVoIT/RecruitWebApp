/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtl.repository;

import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.CurriculumVitae;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CurriculumVitaeRepository {
    boolean addCV(CurriculumVitae cv);
//    boolean updateCV(CurriculumVitae cv); //update CV
    List<CurriculumVitae> getListCvForManage(int candidateID);
    boolean applyCV(CandidateJob c);
    CurriculumVitae getCV(int cvID);
    CandidateJob apply(CandidateJob c);
    CandidateJob getApply(int candidateID, int jobID);
    void deleteCV(int cvID);
}
