package com.vtl.pojo;

import com.vtl.pojo.CandidateCategory;
import com.vtl.pojo.JobCategory;
import com.vtl.pojo.Major;
import com.vtl.pojo.MajorCategory;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(Category.class)
public class Category_ { 

    public static volatile SingularAttribute<Category, Major> majorID;
    public static volatile SingularAttribute<Category, String> name;
    public static volatile SetAttribute<Category, CandidateCategory> candidateCategorySet;
    public static volatile SetAttribute<Category, MajorCategory> majorCategorySet;
    public static volatile SingularAttribute<Category, Integer> id;
    public static volatile SetAttribute<Category, JobCategory> jobCategorySet;

}