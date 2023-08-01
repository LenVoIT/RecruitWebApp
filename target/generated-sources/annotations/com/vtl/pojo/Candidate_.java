package com.vtl.pojo;

import com.vtl.pojo.CandidateCategory;
import com.vtl.pojo.CandidateCompany;
import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.Comment;
import com.vtl.pojo.CurriculumVitae;
import com.vtl.pojo.Major;
import com.vtl.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(Candidate.class)
public class Candidate_ { 

    public static volatile SetAttribute<Candidate, Comment> commentList;
    public static volatile SingularAttribute<Candidate, String> city;
    public static volatile SetAttribute<Candidate, CandidateJob> candidateJobSet;
    public static volatile SetAttribute<Candidate, CandidateCompany> candidateCompanySet;
    public static volatile SingularAttribute<Candidate, String> sex;
    public static volatile SingularAttribute<Candidate, String> degree;
    public static volatile SetAttribute<Candidate, CandidateCategory> candidateCategorySet;
    public static volatile SingularAttribute<Candidate, String> description;
    public static volatile SingularAttribute<Candidate, Date> dateOfBirth;
    public static volatile SingularAttribute<Candidate, String> avatar;
    public static volatile SingularAttribute<Candidate, User> userID;
    public static volatile SetAttribute<Candidate, Major> majors;
    public static volatile SingularAttribute<Candidate, String> major;
    public static volatile SingularAttribute<Candidate, String> phone;
    public static volatile SingularAttribute<Candidate, Integer> id;
    public static volatile SingularAttribute<Candidate, String> fullname;
    public static volatile SetAttribute<Candidate, CurriculumVitae> curriculumVitaeSet;
    public static volatile SingularAttribute<Candidate, String> email;

}