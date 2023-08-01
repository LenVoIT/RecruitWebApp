package com.vtl.pojo;

import com.vtl.pojo.CandidateMajor;
import com.vtl.pojo.Category;
import com.vtl.pojo.CompanyMajor;
import com.vtl.pojo.JobMajor;
import com.vtl.pojo.MajorCategory;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(Major.class)
public class Major_ { 

    public static volatile SetAttribute<Major, JobMajor> jobMajorSet;
    public static volatile SetAttribute<Major, CandidateMajor> candidateMajorSet;
    public static volatile SingularAttribute<Major, String> name;
    public static volatile SetAttribute<Major, CompanyMajor> companyMajorSet;
    public static volatile SetAttribute<Major, MajorCategory> majorCategorySet;
    public static volatile SingularAttribute<Major, Integer> id;
    public static volatile SetAttribute<Major, Category> categorySet;

}