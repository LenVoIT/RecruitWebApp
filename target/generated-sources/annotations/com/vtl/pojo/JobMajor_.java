package com.vtl.pojo;

import com.vtl.pojo.Job;
import com.vtl.pojo.Major;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(JobMajor.class)
public class JobMajor_ { 

    public static volatile SingularAttribute<JobMajor, Job> jobID;
    public static volatile SingularAttribute<JobMajor, Major> majorID;
    public static volatile SingularAttribute<JobMajor, Integer> id;
    public static volatile SingularAttribute<JobMajor, Double> point;

}