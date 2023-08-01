package com.vtl.pojo;

import com.vtl.pojo.CandidateCompany;
import com.vtl.pojo.Comment;
import com.vtl.pojo.CompanyMajor;
import com.vtl.pojo.Job;
import com.vtl.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(Company.class)
public class Company_ { 

    public static volatile ListAttribute<Company, Comment> commentList;
    public static volatile SingularAttribute<Company, String> address;
    public static volatile SingularAttribute<Company, String> city;
    public static volatile SetAttribute<Company, CandidateCompany> candidateCompanySet;
    public static volatile SingularAttribute<Company, String> description;
    public static volatile SingularAttribute<Company, String> avatar;
    public static volatile SingularAttribute<Company, User> userID;
    public static volatile SingularAttribute<Company, Integer> isChecked;
    public static volatile SetAttribute<Company, Job> jobSet;
    public static volatile SingularAttribute<Company, String> name;
    public static volatile SetAttribute<Company, CompanyMajor> companyMajorSet;
    public static volatile SingularAttribute<Company, Integer> id;
    public static volatile SingularAttribute<Company, String> email;

}