/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtl.service;

import com.vtl.pojo.Major;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface MajorService {
    List<Major> getListMajor();
    List<Object[]> getnameOfMajorByJob(int jobId);
    Major getnameOfMajor(int majorID);
}
